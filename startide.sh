#!/bin/bash

usage="-v print version and exit, -p PATH start ide at path, -f pick the path from the projects folder with fzf"

function ide() {
    PROJECT_DIR=${PWD##*/}
    # PROJECT_NAME=${PWD#"${PWD%/*/*}/"}
    # -v /home/simen/Documents/Projects/workspace \
    CONTAINER_NAME="Project_$PROJECT_DIR"
    docker run -it --rm \
        -w /${PROJECT_DIR} \
        -v $PWD:/${PROJECT_DIR} \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -e DOCKER_ID=$(getent group docker | awk '{ gsub(":"," ",$0); print $3 }') \
        -e HOST_PATH=$PWD \
        -e HOST_USER_ID=$(id -u $USER) \
        -e HOST_GROUP_ID=$(id -g $USER) \
        -e PROJECT_NAME=$PROJECT_DIR \
        -e GIT_USER_NAME="Simen Dager Sneve" \
        -e GIT_USER_EMAIL="smndagersneve@gmail.com" \
        -v ~/.ssh:/home/me/.ssh \
        --name $CONTAINER_NAME \
        --net host \
        idecontainer:latest
}

function changepth() {
    origpth="${PWD}"
    newpth="$1"
    cd $newpth && ide && cd $origpth
}

function fzpth() {
    pth=$(ls ${HOME}/Documents/Projects | fzf | sed 's+^+/home/simen/Documents/Projects/+')
    changepth "$pth"
}

case "$1" in
    "-v") echo "0.0.1" ;;
    "-p") changepth "$2" ;;
    "-f") fzpth ;;
    "") ide ;;
    *) echo "$usage" ;;
esac
