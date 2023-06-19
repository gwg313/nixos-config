{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      {
        plugin = power-theme;
        extraConfig = ''
          				set -g @tmux_power_theme 'sky'
          			'';
      }
      resurrect
      continuum
    ];

    extraConfig = ''
          bind -n M-r source-file ~/.config/tmux/tmux.conf

      		set -g mouse on

          set-option -g status-position top

          bind-key g display-popup -h 95% -w 95% -E 'lazygit'
          bind-key t display-popup -h 95% -w 95% -E "${pkgs.htop}/bin/htop"

          bind C-g display-popup -E "tat ~/gallery"

          bind -n M-g display-popup -E "tmux new-session -A -s scratch"

          bind -n M-b switch-client -l
          bind -n M-p previous-window
          bind -n M-n next-window
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
          unbind n
          unbind p

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
          bind p paste-buffer -p  # paste from the top paste buffer
          bind P choose-buffer    # choose which buffer to paste from

          # -- display -------------------------------------------------------------------

          set -g base-index 1           # start windows numbering at 1
          setw -g pane-base-index 1     # make pane numbering consistent with windows
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
      runtimeInputs = [ pkgs.tmux pkgs.fzf ];
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


