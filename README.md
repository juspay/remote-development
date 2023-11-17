# remote-development
NixOS configuration for shared remote development via SSH

## Getting started

Terminology:

- **Host**: The machine you are installing NixOS on.
  - It must already be running Linux (which could even be booted off a rescue image)
- **Guest**: Your current machine, from which you are remotely doing the install.

| Step | Host | Guest |
| ---- | ------ | ---- |
| 1.   | Add your SSH key to `authorized_keys` file in `/root/.ssh` | |
| 2.   | Run `lsblk` to find the `<device-name>` of the disk to partition. For example, `nvme0n1` is the device here: <br><pre>❯ lsblk<br>NAME        MAJ:MIN RM  SIZE RO TYPE<br>nvme0n1     259:0    0  1.9T  0 disk</pre> | |
| 3.   | In `disk-config.nix`, set `disko.devices.disk.main.device = "/dev/<device-name>";` | |
| 4.   | | `nix run github:nix-community/nixos-anywhere -- --flake .#office root@<ip-address>` | 

**Disclaimer**: The `<ip-address>` might change in kexec mode or post-installation, in which case `SSH connection will timeout`, the solution is to `Ctrl-C` and rerun `Step 4` with updated `<ip-address>`.

