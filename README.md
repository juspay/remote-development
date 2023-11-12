# remote-development
NixOS configuration for shared remote development via SSH

## Getting started


| Step | Host | Guest |
| ---- | ------ | ---- |
| 1.   | Add your SSH key to `authorized_keys` file in `/root/.ssh` | |
| 2.   | Run `lsblk` to find the `<device-name>` of the disk to partition. For example, `nvme0n1` is the device here: <br><pre>❯ lsblk<br>NAME        MAJ:MIN RM  SIZE RO TYPE<br>nvme0n1     259:0    0  1.9T  0 disk</pre> | |
| 3.   | Update `disko.devices.disk.main.device = "/dev/<device-name>";` in `disk-config.nix` | |
| 4.   | | `nix run github:nix-community/nixos-anywhere -- --flake .#office root@<ip-address>` | 

**_Note:_ Target above can be any linux machine or a bootable USB (haven't tested the latter yet).**
