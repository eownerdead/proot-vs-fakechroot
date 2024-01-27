# PRoot vs. fakechroot

## Result

```
$ nix run .#bench
+ sudo bash
doas (noobuser@nixos) password:
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.6CFPZ605MJ

real	0m6.717s
user	0m6.715s
sys	0m2.050s
+ tar -cf /tmp/tmp.QP8rLlSzOC.tar -P /tmp/tmp.6CFPZ605MJ

real	0m2.755s
user	0m0.539s
sys	0m2.168s
+ proot -R /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.pWiI9sl3qr

real	0m13.475s
user	0m6.934s
sys	0m7.772s
+ tar -cf /tmp/tmp.KEp7sqBkM7.tar -P /tmp/tmp.pWiI9sl3qr

real	0m14.413s
user	0m0.462s
sys	0m6.117s
+ fakechroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.YvCsImGve5

real	0m10.298s
user	0m7.233s
sys	0m8.421s
+ tar -cf /tmp/tmp.ofvg4LQs9t.tar -P /tmp/tmp.YvCsImGve5

real	0m7.999s
user	0m0.874s
sys	0m6.985s
+ fakechroot fakeroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.vRCEdlSnmS

real	0m12.593s
user	0m7.460s
sys	0m10.862s
+ tar -cf /tmp/tmp.fnXOADMTtA.tar -P /tmp/tmp.vRCEdlSnmS

real	0m10.924s
user	0m1.367s
sys	0m8.312s
+ bwrap --unshare-all --bind /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx / --tmpfs /tmp /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.pYQpSxk1A5

real	0m6.722s
user	0m6.658s
sys	0m1.964s
+ tar -cf /tmp/tmp.D0IlsETi0t.tar -P /tmp/tmp.pYQpSxk1A5

real	0m1.767s
user	0m0.319s
sys	0m1.434s

$ nix run .#bench
+ sudo bash
doas (noobuser@nixos) password:
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.x5ixsgaYLy

real	0m6.711s
user	0m6.723s
sys	0m2.078s
+ tar -cf /tmp/tmp.nDWZ61sc2p.tar -P /tmp/tmp.x5ixsgaYLy

real	0m2.758s
user	0m0.524s
sys	0m2.183s
+ proot -R /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.c5la6VCsAS

real	0m13.534s
user	0m6.858s
sys	0m7.813s
+ tar -cf /tmp/tmp.ei37FgAixQ.tar -P /tmp/tmp.c5la6VCsAS

real	0m14.266s
user	0m0.418s
sys	0m5.941s
+ fakechroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.VoCLdZun5x

real	0m10.283s
user	0m7.246s
sys	0m8.350s
+ tar -cf /tmp/tmp.5cjigQBDKt.tar -P /tmp/tmp.VoCLdZun5x

real	0m7.738s
user	0m0.857s
sys	0m6.731s
+ fakechroot fakeroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.Q9rp355CXY

real	0m12.688s
user	0m7.437s
sys	0m10.886s
+ tar -cf /tmp/tmp.BtrgpUvc6O.tar -P /tmp/tmp.Q9rp355CXY

real	0m11.030s
user	0m1.323s
sys	0m8.295s
+ bwrap --unshare-all --bind /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx / --tmpfs /tmp /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.WJYwGKkPGI

real	0m6.724s
user	0m6.690s
sys	0m1.899s
+ tar -cf /tmp/tmp.KQrVamMnms.tar -P /tmp/tmp.WJYwGKkPGI

real	0m1.763s
user	0m0.322s
sys	0m1.426s

$ nix run .#bench
+ sudo bash
doas (noobuser@nixos) password:
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.oue28BWHMK

real	0m6.697s
user	0m6.698s
sys	0m2.039s
+ tar -cf /tmp/tmp.9UB7V04cB3.tar -P /tmp/tmp.oue28BWHMK

real	0m2.748s
user	0m0.522s
sys	0m2.176s
+ proot -R /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.guvYrL8xdF

real	0m13.506s
user	0m6.869s
sys	0m7.798s
+ tar -cf /tmp/tmp.gtBB4y1157.tar -P /tmp/tmp.guvYrL8xdF

real	0m14.549s
user	0m0.441s
sys	0m6.131s
+ fakechroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.M2e8ihakAB

real	0m9.914s
user	0m7.148s
sys	0m8.307s
+ tar -cf /tmp/tmp.bFnsTh2Hto.tar -P /tmp/tmp.M2e8ihakAB

real	0m12.442s
user	0m0.907s
sys	0m5.530s
+ fakechroot fakeroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.f01qyurbyS

real	0m12.338s
user	0m7.448s
sys	0m10.729s
+ tar -cf /tmp/tmp.f6y7pwBDkR.tar -P /tmp/tmp.f01qyurbyS

real	0m13.280s
user	0m1.349s
sys	0m6.929s
+ bwrap --unshare-all --bind /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx / --tmpfs /tmp /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.X3yjqmZSSh

real	0m6.759s
user	0m6.688s
sys	0m2.002s
+ tar -cf /tmp/tmp.vNDjpH34Fj.tar -P /tmp/tmp.X3yjqmZSSh

real	0m1.801s
user	0m0.338s
sys	0m1.447s

$ nix run .#bench
+ sudo bash
doas (noobuser@nixos) password:
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.FRg0qA3ojH

real	0m6.698s
user	0m6.700s
sys	0m2.073s
+ tar -cf /tmp/tmp.XJqV2dQ4ns.tar -P /tmp/tmp.FRg0qA3ojH

real	0m2.844s
user	0m0.538s
sys	0m2.251s
+ proot -R /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.PMKNVRFahO

real	0m13.473s
user	0m6.917s
sys	0m7.797s
+ tar -cf /tmp/tmp.Hy4wiOpTNq.tar -P /tmp/tmp.PMKNVRFahO

real	0m14.316s
user	0m0.421s
sys	0m5.977s
+ fakechroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.yPOZEsRogf

real	0m9.973s
user	0m7.154s
sys	0m8.333s
+ tar -cf /tmp/tmp.WFf7tGAtTe.tar -P /tmp/tmp.yPOZEsRogf

real	0m14.703s
user	0m0.914s
sys	0m5.522s
+ fakechroot fakeroot chroot /nix/store/ixr9qfkm2fx9z1mmhxfmwm5w7jxi47nd-tarx-linked /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.RVN7nlU468

real	0m12.592s
user	0m7.431s
sys	0m10.853s
+ tar -cf /tmp/tmp.wpV0TNJpWQ.tar -P /tmp/tmp.RVN7nlU468

real	0m11.068s
user	0m1.352s
sys	0m8.307s
+ bwrap --unshare-all --bind /nix/store/74kiaw4wqa4lhzrrl17gvynj3wqk6q2z-tarx / --tmpfs /tmp /bin/entrypoint
+ tar -xf /nix/store/n187l09srvy2vzammb5vixgrpixyypgs-linux-6.1.74.tar.xz -C /tmp/tmp.9NXHPEPB4w

real	0m6.703s
user	0m6.703s
sys	0m1.872s
+ tar -cf /tmp/tmp.eGzRTeSRyn.tar -P /tmp/tmp.9NXHPEPB4w

real	0m1.763s
user	0m0.330s
sys	0m1.419s
```
