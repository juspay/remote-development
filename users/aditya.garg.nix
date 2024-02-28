{
  pubKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDGLS/MZZfynaJLEi/sdWXKUT1DusvR7YaOuOLPfsvnwgj/ruR+WeTloma+gqU0aXUk7nUgpcIdbuYGlMRghTAFS3wqz30oOLkV21tbpXFZjlgujBfz3VRLvwAURVVPkjtEzplk7dsMO68K3IybxcKHJAQjbqSQtxHy6X5IsXb0xaC9uzJYHtpuilIJxijTI4ur51VSy6w0v4EwdZwKwZ83kPx7POnPRPVpojZs2LbYzu2KZWIcjFUZCCXNSV2k0y9lxVmn4jTOmdcdZ4xJHzWmXZoTWOFKgBZyWCN6WNZrjh6zMePFzCq34r4XYAuKqNQ9gYg3Vi6Mzexe6hQcXliDkavWi4Lutk850O1YWx5SMwHhSidfpMzNFA4Zvz6DrrDNmJa0r/hF57w+uZZCN+OYeSyp6d2RD8aohMnmICcX7pjrHU5HqH+dwK70KVKxWBLz0L/ShUNsz10zwRPLx+9EJDfaC/8B/4nBnqVuQQiNpHih/cuzt/SJ8eX2o7N/oSdvZTjUL5THtwB+pd4WyYqgeqHCWT3ZObDGVnfKzYwvb1s0MM4IklBvFArXbn6DKVqVw1UrjoCEkEMy5h+ttGSE0UwDWejSgPfoWpa+L6/Qb0jgyQFrhEIQ/VxSX+hfRnUcCeRRe9C9aRiOApbRl1mQfpwuFgyTbo52gwQ4C/lqxw== aditya.garg@adityagarg-Q42YP4LG4J.local"
  ];

  homeModule = { pkgs, lib, ... }: {
    programs.git = {
      userName = "Aditya Garg";
      userEmail = "aditya.garg@juspay.in";
      aliases = {
        gco = "git checkout";
        gc = "git commit";
        gs = "git status";
        gb = "git branch";
      };
    };
  };
}
