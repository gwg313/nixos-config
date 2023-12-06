{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ansible # Open-source automation platform for configuration management, application deployment, and task automation.
    ansible-doctor # Ansible utility for diagnosing and troubleshooting common issues.
    ansible-later # Ansible plugin for scheduling tasks to run later.
    molecule # Testing framework for testing Ansible roles and playbooks in various environments.
  ];
}
