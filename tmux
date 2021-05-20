set -sg escape-time 10
set -g history-limit 50000
set -g display-time 4000
set -g status-interval 5
#set -g default-terminal "screen-256color"
set -g default-terminal 'xterm-256color'
set -as terminal-overrides ',xterm*:Tc:sitm=\E[3m'
set -g status-keys emacs
set-window-option -g mode-keys vi
set -g focus-events on
set -g base-index 1
set -g mouse on
setw -g aggressive-resize on
set-option -g prefix C-a
bind-key C-a send-prefix
unbind p
unbind n

bind r source-file ~/.tmux.conf
bind -n C-p previous-window
bind -n C-n next-window

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
# is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    # | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

# is_fzf="ps -o state= -o comm= -t '#{pane_tty}' \
  # | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?fzf$'"

# bind -n C-h run "($is_vim && tmux send-keys C-h) || \
                          # tmux select-pane -L"

# bind -n C-j run "($is_vim && tmux send-keys C-j)  || \
                         # ($is_fzf && tmux send-keys C-j) || \
                         # tmux select-pane -D"

# bind -n C-k run "($is_vim && tmux send-keys C-k) || \
                          # ($is_fzf && tmux send-keys C-k)  || \
                          # tmux select-pane -U"

# bind -n C-l run  "($is_vim && tmux send-keys C-l) || \
                          # tmux select-pane -R"
# bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
# bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
# bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
# bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
# bind -n C-h run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
# bind -n C-j run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
# bind -n C-k run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
# bind -n C-l run "(tmux display-message -p '#{pane_title}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"


# tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
# if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
    # "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
# if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
    # "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"

# bind-key -T copy-mode-vi 'C-h' select-pane -L
# bind-key -T copy-mode-vi 'C-k' select-pane -U
# bind-key -T copy-mode-vi 'C-l' select-pane -R
# bind-key -T copy-mode-vi 'C-j' select-pane -D
# bind-key -T copy-mode-vi 'C-\' select-pane -l

bind v split-window -h -c "#{pane_current_path}"
bind h split-window -v -c "#{pane_current_path}"

################################### PLUGINS ####################################

# set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'laktak/extrakto'
set -g @plugin 'olimorris/tmux-pomodoro-plus'
# set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-online-status'
set -g @plugin 'christoomey/vim-tmux-navigator'

################################## PLUGINOPTS ##################################

set -g @pomodoro_start 'p'                          # Start a Pomodoro
set -g @pomodoro_cancel 'P'                         # Cancel a Pomodoro
set -g @pomodoro_mins 45
set -g @pomodoro_break_mins 15

################################## STATUSLINE ##################################

color_bg="#1e1e1e"
color_fg="#aab2bf"
color_green="#98c379"
color_yellow="#e5c07b"
color_red="#e06c75"
color_blue="#61afef"
color_purple="#c678dd"
color_gray="#696C77"
color_selection="#3e4452"

text_normal=$color_gray
text_highlight=$color_green
text_emphasise=$color_purple
text_red=$color_red
text_green=$color_green
text_yellow=$color_yellow

set -g status-interval 5
set -g status-justify "left"
set -g status-left-length "100"
set -g status "on"
set -g status-right-length "160"
set -g status-right-style none
set -g message-style bg=$color_green,fg=$color_bg
set -g status-style none
set -g pane-border-style bg=default,fg=$color_bg
set -g pane-active-border-style bg=default,fg=$color_fg
set -g status-left-style none
setw -g window-status-style bg=default,fg=$color_bg,none
setw -g window-status-current-style bg=default,fg=$color_bg
setw -g window-status-activity-style fg=$color_green,none
setw -g window-status-separator ""
set-window-option -g mode-style bg=$color_selection,fg=$color_fg
set -g @prefix_highlight_bg $color_blue # blue
set -g @prefix_highlight_fg $color_bg # white / bg

# tmux-online-status
set -g @online_icon ""
set -g @offline_icon "#[fg=$color_red]"

# tmux-pomodoro
set -g @pomodoro_on " #[fg=$text_red] "
set -g @pomodoro_complete " #[fg=$text_green] "

# @ram_low_icon "  " # icon when cpu is low
# @ram_medium_icon "  " # icon when cpu is medium
# @ram_high_icon "  " # icon when cpu is high
# @ram_low_bg_color "" # foreground color when cpu is low
# @ram_medium_bg_color "" # foreground color when cpu is medium
# @ram_high_bg_color "" # foreground color when cpu is high
# @ram_low_fg_color "#[bg=green]" # background color when cpu is low
# @ram_medium_fg_color "#[bg=yellow]" # background color when cpu is medium
# @ram_high_fg_color "#[bg=red]" # background color when cpu is high
# @ram_percentage_format "%3.1f%%" # printf format to use to display percentage
# @ram_medium_thresh "30" # medium percentage threshold
# @ram_high_thresh "80" # high percentage threshold


set -g status-left "#{prefix_highlight} #[fg=$text_emphasise,bold] ~#S~"
set -g status-right "#{pomodoro_status}#[fg=$text_normal]#{online_status}#[fg=$text_normal] |  %R   %d/%m/%Y "
setw -g window-status-format "#[fg=$text_normal,nobold,nounderscore,noitalics] #[fg=$text_normal] #I #W #[fg=$text_normal,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=$text_normal,nobold,nounderscore,noitalics] #[fg=$text_highlight] #I #W #[fg=$text_normal,nobold,nounderscore,noitalics]"


# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run -b "/home/me/.tmux/plugins/tpm/tpm"
