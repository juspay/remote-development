# remote-development

[NixOS](https://nixos.asia/en/nixos) configuration for shared remote [development](https://nixos.asia/en/dev) via SSH

## Getting started

>[!TODO]
> We are still writing this, but for now, see: https://nixos.asia/en/nixos-tutorial

### Deploying `vanjaram`

Currently, we are managing a single NixOS machine called `vanjaram`. It does not use disko (see section below) yet. This is how we update its configuration:

```
# SSH to vanjaram (via tailscale)
ssh {srid|remotedev}@vanjaram
> cd /etc/nixos
# ^ This points to this git repository
> nix run
# ^ This runs 'nixos-rebuild switch' (via nixos-flake)
```

Make sure to push your changes to Git. Later, we want to figure out remote deployment here.

## Discussion

For discussing this project, please [join our Zulip](https://nixos.zulipchat.com/#narrow/stream/413948-nixos).
