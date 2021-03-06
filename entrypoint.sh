#!/bin/sh

# Git config
if [ ! -z "$GIT_USER_NAME" ] && [ ! -z "$GIT_USER_EMAIL" ]; then
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
fi

# Create users and groups to match the hosts
export HOST_USER_ID=${HOST_USER_ID:-`stat -c %u /workspace`}
export HOST_GROUP_ID=${HOST_GROUP_ID:-`stat -c %g /workspace`}
echo "me:x:$HOST_USER_ID:$HOST_GROUP_ID:me:/home/me:/bin/zsh" >> /etc/passwd
echo "group:x:$HOST_GROUP_ID:me" >> /etc/group
sed -i "s/docker:.*:/docker:x:$DOCKER_ID:me/" /etc/group

# Keep the ssh secrets sanitized
[ -d "/local/.ssh" ] && cp -r /local/.ssh /home/me/.ssh

# This is to ensure all the files that we copy into the container are owned
# with the right permissions
chown -R me: /home/me
export PROJECT_NAME=${PROJECT_NAME:-"Standalone"}

# Start tmux and zsh
# exec /sbin/su-exec me zsh
exec /sbin/su-exec me tmux -u -2 "$@" -c "tmux new-session -s $PROJECT_NAME -c /$PROJECT_NAME zsh"
# exec /sbin/su-exec me ${HOME}/.local/bin/tmuxp load -2 -s "$PROJECT_NAME" ${HOME}/defaulttmuxsession.yaml
