# remote-development

[NixOS](https://nixos.asia/en/nixos) configuration for shared remote [development](https://nixos.asia/en/dev) via SSH

## Getting started

>[!TODO]
> We are still writing this, but for now, see: https://nixos.asia/en/nixos-tutorial

### Deploying `vanjaram`

Currently, we are managing a single NixOS machine called `vanjaram`. It does not use disk (see section below) yet. This is how we update its configuration:

```
# SSH to vanjaram (via tailscale)
ssh {srid|remotedev}@vanjaram
> cd /etc/nixos
# ^ This points to this git repository
> sudo nixos-rebuild switch
```

Make sure to push your changes to Git. Later, we want to figure out remote deployment here.

### OLD disko instructions

>[!NOTE] 
> These are not being in effect, yet.

Terminology:

- **Host**: The machine you are installing NixOS on.
  - It must already be running Linux (which could even be booted off a rescue image)
- **Guest**: Your current machine, from which you are remotely doing the install.


| Step | Host | Guest |
| ---- | ------ | ---- |
| 1.   | Add your SSH key to `authorized_keys` file in `/root/.ssh` | Add the same key in your configuration (here, `flake.nix`) under: `users.users.root.openssh.authorizedKeys.keys = [ "<your-ssh-key>" ];` |
| 2.   | Run `lsblk` to find the `<device-name>` of the disk to partition. For example, `nvme0n1` is the device here: <br><pre>❯ lsblk<br>NAME        MAJ:MIN RM  SIZE RO TYPE<br>nvme0n1     259:0    0  1.9T  0 disk</pre> | |
| 3.   | | In `disk-config.nix`, set `disko.devices.disk.main.device = "/dev/<device-name>";` |
| 4.   | | `nix run github:nix-community/nixos-anywhere -- --flake .#office root@<ip-address>` |
| 5.   | | Deploy incremental changes with `nix run github:serokell/deploy-rs -- --remote-build .#nixos-remote-01` |

**Disclaimer**: The `<ip-address>`[^1] might change in kexec mode or post-installation, in which case `SSH connection will timeout`, the solution is to `Ctrl-C` and rerun `Step 4` with updated `<ip-address>`.
[^1]: Find the `<ip-address>` using `ifconfig` or `ip a`. Under the device name you will find a line that looks like: `inet <ip-address>  ...`

## Discussion

For discussing this project, please [join our Zulip](https://nixos.zulipchat.com/#narrow/stream/413948-nixos).
