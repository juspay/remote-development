{
  pubKeys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDrs8963yf7x8tOH0xSHA3AaWwmbLIG0OAXGb40ttz4DDQTsbRlbI6JfmKBqGb13lnnCOI88eVQv2eFF3uxkf60yA5KgGM9ds7TVrtxrleNk5Jj/ydZ3mdtmj5QksU0FTXfRTBnMk5DBoXBfq1Gr1hdhYNYHaiek3Oc1DtxzWbzFArXSrltYK5ZWdayMnRDwAi1QphXOBIr//B/wtYQ1XDZO7WpZL/vSOdR9ynKM3A72ISv45k9LH2mt/+yxg79K6etSGqi9p2Qpf3/afEleR0dtD27GmXioBDLOw5OMKBdb1ZnScuu6IAiDrB8pDvTA2cvLmfj7z2v0bxvoFwVfeV5mATYXPUCjqKTJbszUC46WYtbdV8T9cRuiNraV5e0Qw53MvYmKllHh+CEGmwuatLaw1/d7h9WiKZrE6KRo+QuS/Gxt6wv/2YoqEhqCigim0eNuSdehofBlegl1p7ZSMYGJoBuPoTRyT+GJfdKczRT0+/upDowFk5vczjizmwJeQ0= pratik.narola@pratiknarola-FHQFWKR7W5.local"
  ];

  homeModule = { pkgs, lib, ... }: {
    programs.git = {
      userName = "Pratik Narola";
      userEmail = "pratik.narola@juspay.in";
      aliases = {
        gco = "git checkout";
        gst = "git status"
        gc = "git commit";
        gpsup = "git push --set-upstream origin";
        gb = "git branch";
        gl = "git pull";
        gpf = "git push --force-with-lease";
      };
    };
  };
}
