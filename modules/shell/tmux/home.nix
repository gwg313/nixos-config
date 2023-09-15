{ pkgs, config, user, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      #      {
      #        plugin = power-theme;
      #        extraConfig = ''
      #          				set -g @tmux_power_theme 'sky'
      #          			'';
      #      }
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

            # THEME

            right_arrow_icon=''
            left_arrow_icon=''
            upload_speed_icon=''
            download_speed_icon=''
            session_icon=''
            user_icon=''
            time_icon=''
            date_icon=''
            time_format='%T'
            date_format='%F'

            # short for Theme-Colour
            TC="#${config.colorScheme.colors.base09}"

            G01=#080808 #232
            G02=#121212 #233
            G03=#1c1c1c #234
            #G04=#262626 #235
            G04=#${config.colorScheme.colors.base00} #235
            G05=#303030 #236
            #G06=#3a3a3a #237
            G06=#${config.colorScheme.colors.base02} #237
            G07=#444444 #238
            G08=#4e4e4e #239
            G09=#585858 #240
            G10=#626262 #241
            G11=#6c6c6c #242
            G12=#767676 #243

            FG="#${config.colorScheme.colors.base03}"
            BG="#${config.colorScheme.colors.base00}"

            # Status options
            set-option -gq status-interval 1
            set-option -gq status on

            # Basic status bar colors
            set-option -gq status-fg "$FG"
            set-option -gq status-bg "$BG"
            set-option -gq status-attr none

            # tmux-prefix-highlight
            set-option -gq @prefix_highlight_fg "$BG"
            set-option -gq @prefix_highlight_bg "$FG"
            set-option -gq @prefix_highlight_show_copy_mode 'on'
            set-option -gq @prefix_highlight_copy_mode_attr "fg=$TC,bg=$BG,bold"
            set-option -gq @prefix_highlight_output_prefix "#[fg=$TC]#[bg=$BG]$left_arrow_icon#[bg=$TC]#[fg=$BG]"
            set-option -gq @prefix_highlight_output_suffix "#[fg=$TC]#[bg=$BG]$right_arrow_icon"

            #     
            # Left side of status bar
            set-option -gq status-left-bg "$G04"
            set-option -gq status-left-fg "G12"
            set-option -gq status-left-length 150
            user=${user}
            LS="#[fg=$G04,bg=$TC,bold] $user_icon $user@#h #[fg=$TC,bg=$G06,nobold]$right_arrow_icon#[fg=$TC,bg=$G06] $session_icon #S "
                LS="$LS#[fg=$G06,bg=$BG]$right_arrow_icon"
                LS="$LS#{prefix_highlight}"

            set-option -gq status-left "$LS"

            # Right side of status bar
            set-option -gq status-right-bg "$BG"
            set-option -gq status-right-fg "G12"
            set-option -gq status-right-length 150
            RS="#[fg=$G06]$left_arrow_icon#[fg=$TC,bg=$G06] $time_icon $time_format #[fg=$TC,bg=$G06]$left_arrow_icon#[fg=$G04,bg=$TC] $date_icon $date_format "

            set-option -gq status-right "$RS"

            # Window status
            set-option -gq window-status-format " #I:#W#F "
            set-option -gq window-status-current-format "#[fg=$BG,bg=$G06]$right_arrow_icon#[fg=$TC,bold] #I:#W#F #[fg=$G06,bg=$BG,nobold]$right_arrow_icon"

            # Window separator
            set-option -gq window-status-separator ""

            # Window status alignment
            set-option -gq status-justify centre

            # Current window status
            set-option -gq window-status-current-statys "fg=$TC,bg=$BG"

            # Pane border
            set-option -gq pane-border-style "fg=$G07,bg=default"

            # Active pane border
            set-option -gq pane-active-border-style "fg=$TC,bg=$BG"

            # Pane number indicator
            set-option -gq display-panes-colour "$G07"
            set-option -gq display-panes-active-colour "$TC"

            # Clock mode
            set-option -gq clock-mode-colour "$TC"
            set-option -gq clock-mode-style 24

            # Message
            set-option -gq message-style "fg=$TC,bg=$BG"

            # Command message
            set-option -gq message-command-style "fg=$TC,bg=$BG"

            # Copy mode highlight
            set-option -gq mode-style "bg=$TC,fg=$FG"

            # vim: set ft=tmux tw=0 nowrap:

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


