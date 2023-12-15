{
  pkgs,
  config,
  user,
  ...
}: {
  stylix.targets.tmux.enable = false;
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
      vim-tmux-navigator
      tmux-thumbs
    ];

    extraConfig = ''
      bind -n M-r source-file ~/.config/tmux/tmux.conf

      set -ag terminal-overrides ",xterm-256color:RGB"



      set -g detach-on-destroy off # don't exit from tmux when closing a session

      # New Theme
      set -g status-interval 3     # update the status bar every 3 seconds
      set -g status-left "#[fg=blue,bold,bg=#${config.lib.stylix.colors.base00}]#S    "
      set -g status-right "#[fg=#${config.lib.stylix.colors.base07},bold,bg=#${config.lib.stylix.colors.base00}]%a %Y-%m-%d 󱑒 %l:%M %p"
      set -ga status-right "#($HOME/.config/tmux/scripts/cal.sh)"
      set -g status-justify left
      set -g status-left-length 200    # increase length (from 10)
      set -g status-right-length 200    # increase length (from 10)
      set -g status-position top       # macOS / darwin style
      set -g status-style 'bg=#${config.lib.stylix.colors.base00}' # transparent
      set -g window-status-current-format '#[fg=magenta,bg=#${config.lib.stylix.colors.base00}]#I #W#{?window_zoomed_flag,(),} '
      set -g window-status-format '#[fg=gray,bg=#${config.lib.stylix.colors.base00}] #I #W'
      set -g window-status-last-style 'fg=white,bg=black'
      set -g message-command-style bg=default,fg=yellow
      set -g message-style bg=default,fg=yellow
      set -g mode-style bg=default,fg=yellow
      set -g pane-active-border-style 'fg=magenta,bg=default'
      set -g pane-border-style 'fg=brightblack,bg=default'
      set -g @tmux-last-prompt-pattern ' '



      set -g mouse on

      set-option -g status-position top

      bind-key g display-popup -h 95% -w 95% -E 'lazygit'
      bind-key t display-popup -h 95% -w 95% -E "${pkgs.htop}/bin/htop"

      bind C-g display-popup -E "tat ~/Projects"

      bind -n M-g display-popup -E "tmux new-session -A -s scratch"

      bind -n M-b switch-client -l
      bind -n M-p previous-window # for ansi
      bind -n M-n next-window # for ansi
      bind -n M-P switch-client -p
      bind -n M-N switch-client -n

      unbind f
      bind f resize-pane -Z

      # create session
      bind C-c new-session

      # split current window horizontally
      bind - split-window -v
      # split current window vertically
      bind _ split-window -h

      # Select Layouts
      #―――――――――――――――――
      bind -n M-a select-layout main-vertical
      bind -n M-A select-layout main-horizontal
      bind -n M-E select-layout even-vertical
      bind -n M-V select-layout even-horizontal

      # pane navigation
      bind -r h select-pane -L  # move left
      bind -r j select-pane -D  # move down
      bind -r k select-pane -U  # move up
      bind -r l select-pane -R  # move right
      bind > swap-pane -D       # swap current pane with the next one
      bind < swap-pane -U       # swap current pane with the previous one

      # pane resizing
      bind -r H resize-pane -L 2
      bind -r J resize-pane -D 2
      bind -r K resize-pane -U 2
      bind -r L resize-pane -R 2
      bind -r c-f resize-pane -Z

      # window navigation
      # unbind n
      # unbind p

      setw -g mode-keys vi

      bind Enter copy-mode # enter copy mode

      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi C-v send -X rectangle-toggle
      bind -T copy-mode-vi y send -X copy-selection-and-cancel
      bind -T copy-mode-vi Escape send -X cancel
      bind -T copy-mode-vi H send -X start-of-line
      bind -T copy-mode-vi L send -X end-of-line

      # -- buffers -------------------------------------------------------------------

      bind b list-buffers     # list paste buffers
      #bind p paste-buffer -p  # paste from the top paste buffer
      bind P choose-buffer    # choose which buffer to paste from

      # -- display -------------------------------------------------------------------

      set -g renumber-windows on    # renumber windows when a window is closed

      bind k display-popup -E "\
          tmux list-sessions -F '#{?session_attached,,#{session_name}}' |\
          fzf --reverse -m --header=kill-session |\
          xargs -I {} tmux kill-session -t {}"

      bind C-j display-popup -E "\
          tmux list-sessions -F '#{?session_attached,,#{session_name}}' |\
          sed '/^$/d' |\
          fzf --reverse --header jump-to-session --preview 'tmux capture-pane -pt {}'  |\
          xargs tmux switch-client -t"


    '';
  };

  programs.tmate = {
    enable = true;
  };

  home.packages = [
    # Open tmux for current project.
    (pkgs.writeShellApplication {
      name = "tat";
      runtimeInputs = [pkgs.tmux pkgs.fzf];
      text = builtins.readFile ./ta.sh;
    })
    pkgs.fzf
  ];

  programs.zsh = {
    shellAliases = {
      tx = "tmux new -s default";
      ta = "tmux attach -t";
      tad = "tmux attach -d -t";
      ts = "tmux new-session -s";
      tl = "tmux list-sessions";
      tksv = "tmux kill-server";
      tkss = "tmux kill-session -t";
    };
  };
}
