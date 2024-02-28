# remote-development

[NixOS](https://nixos.asia/en/nixos) configuration for shared remote [development](https://nixos.asia/en/dev) via SSH

## Getting started

>[!todo] 
> We are still writing this, but for now, see: https://nixos.asia/en/nixos-tutorial

### Deploying `vanjaram`

Currently, we are managing a single NixOS machine called `vanjaram`. It does not use disko. This is how we update its configuration:

```
# SSH to vanjaram (via tailscale)
ssh srid@vanjaram
> cd /etc/nixos
# ^ This points to this git repository
> nix run
# ^ This runs 'nixos-rebuild switch' (via nixos-flake)
```

Make sure to push your changes to Git. Later, we want to figure out remote deployment here.

## Adding users

1. If your Juspay email address is `myname@juspay.in`, add yourself to `users/myname.nix`. See `users/srid.nix` for example. Then open a PR.

## Discussion

For discussing this project, please [join our Zulip](https://nixos.zulipchat.com/#narrow/stream/413948-nixos).
