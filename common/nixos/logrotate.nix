{
  ...
}:
{

  services.logrotate = {
    settings = {
      header = {
        dateext = true;
      };

      "var/log/audit/audit.log" = {
        frequency = "daily";
        rotate = 3;
        size = "100k";
      };
    };
  };
}
