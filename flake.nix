{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        mkRoot' = { name, drv, extraBuildCommands ? "" }:
          let closure = pkgs.writeReferencesToFile drv;
          in pkgs.buildEnv {
            inherit name;
            paths = [ drv ];
            postBuild = ''
              mkdir -p $out/nix/store/
              cp -r $(cat ${closure}) $out/nix/store/
              ${extraBuildCommands}
            '';
          };

        mkRoot = { name, drv }:
          mkRoot' {
            inherit name drv;
            extraBuildCommands = ''
              mkdir $out/tmp
            '';
          };

        mkRootLinked = { name, drv }:
          mkRoot' {
            inherit name drv;
            extraBuildCommands = ''
              ln -s /tmp $out/tmp
            '';
          };

        entrypoint = pkgs.writeShellApplication {
          name = "entrypoint";
          runtimeInputs = with pkgs; [ coreutils gnutar xz ];
          text = ''
            set +e
            tmpx=$(mktemp -d)
            tmpc="$(mktemp).tar"
            (
              set -x
              time tar -xf ${pkgs.linux.src} -C "$tmpx"
              time tar -cf "$tmpc" -P "$tmpx"
            )
            rm -rf "$tmpx" "$tmpc"
          '';
        };
      in rec {
        formatter = pkgs.nixfmt;

        packages = rec {
          bench = pkgs.writeShellApplication {
            name = "bench";
            runtimeInputs = with pkgs; [
              proot
              packages.fakechroot
              fakeroot
              bubblewrap
            ];
            text = ''
              set +e
              set -x

              sudo bash << EOF
                mount tmp ${tarx}/tmp -t tmpfs
                chroot ${tarx} /bin/entrypoint
                umount ${tarx}/tmp
              EOF

              proot -R ${tarx} /bin/entrypoint

              fakechroot chroot ${tarx-linked} /bin/entrypoint

              fakechroot fakeroot chroot ${tarx-linked} /bin/entrypoint

              bwrap --unshare-all --bind ${tarx} / --tmpfs /tmp /bin/entrypoint
            '';

          };
          tarx = mkRoot {
            name = "tarx";
            drv = entrypoint;
          };
          tarx-linked = mkRootLinked {
            name = "tarx-linked";
            drv = entrypoint;
          };
          fakechroot = pkgs.fakechroot.overrideAttrs (old: {
            patches = old.patches ++ [
              # pass __readlinkat_chk buffer length
              (pkgs.fetchpatch {
                url =
                  "https://github.com/dex4er/fakechroot/pull/115/commits/15479d9436b534cee0115064bd8deb8d4ece9b8c.patch";
                hash = "sha256-wMIZ3hW5XkRXQYBMADlN6kxhDSiEr84PGWBW+f4b4Ko=";
              })
            ];
          });
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            editorconfig-checker
            nixfmt
            proot
            packages.fakechroot
            fakeroot
            bwrap
          ];
        };
      });
}
