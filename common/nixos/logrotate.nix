{
  ...
}:
{

  services.logrotate = {
    settings = {
      "var/log/audit/audit.log" = {
        frequency = "daily";
        rotate = 3;
      };
    };
  };
}
