#!/bin/bash

# Arguments: $1 = current_command, $2 = full_path
CMD=$1
PATH_NAME=$2
BASENAME=$(basename "$PATH_NAME")

# 1. Check by Command (Process-level detection)
case "$CMD" in
*nvim* | *vim*) echo "" && exit ;;
*python*) echo "" && exit ;;
*node* | *npm*) echo "󰎙" && exit ;;
*rust* | *cargo*) echo "" && exit ;;
*go*) echo "" && exit ;;
*gcc* | *g++*) echo "" && exit ;; # Essential for CP
*git*) echo "󰊢" && exit ;;
*docker*) echo "󰡨" && exit ;;
*lua*) echo "" && exit ;;
esac

# 2. Check by Folder Name (Comprehensive Directory Detection)
case "$BASENAME" in
# Code & Structure
src | source) echo "󰜔" && exit ;;
api | apis) echo "󱂇" && exit ;;
db | database*) echo "󰆼" && exit ;;
include | inc) echo "" && exit ;;
lib | libs) echo "󰉬" && exit ;;
test | tests) echo "󰙨" && exit ;; # Great for your QA background
build | dist) echo "󰫗" && exit ;;
scripts) echo "󱆃" && exit ;;

# Config & System
.config | config) echo "" && exit ;;
.git) echo "󰊢" && exit ;;
.tmux) echo "" && exit ;;
bin | sbin) echo "󰆧" && exit ;;

# Web & Cloud
public | www) echo "󰖟" && exit ;;
docker | .docker) echo "󰡨" && exit ;;
aws | .aws) echo "󰸏" && exit ;;

# Personal/Standard
downloads) echo "󰇚" && exit ;;
documents) echo "󱔗" && exit ;;
pictures) echo "󰉏" && exit ;;
videos) echo "󰈫" && exit ;;
desktop) echo "󰇄" && exit ;;
esac

# 3. Deep File Detection (Project Type Identification)
# Web
if [ -f "$PATH_NAME/package.json" ]; then echo "󰎙" && exit; fi
if [ -f "$PATH_NAME/tsconfig.json" ]; then echo "" && exit; fi
# Systems/CP
if [ -f "$PATH_NAME/CMakeLists.txt" ]; then echo "" && exit; fi
if [ -f "$PATH_NAME/Makefile" ]; then echo "" && exit; fi
if [ -f "$PATH_NAME/Cargo.toml" ]; then echo "" && exit; fi
if [ -f "$PATH_NAME/go.mod" ]; then echo "" && exit; fi
# Data/Config
if [ -f "$PATH_NAME/docker-compose.yml" ]; then echo "󰡨" && exit; fi
if [ -f "$PATH_NAME/.env" ]; then echo "󱇢" && exit; fi
# Backend/Cloud
if [ -f "$PATH_NAME/main.go" ]; then echo "" && exit; fi
if [ -f "$PATH_NAME/main.py" ]; then echo "" && exit; fi
if [ -d "$PATH_NAME/.git" ]; then echo "" && exit; fi

# Default fallback (Plain Folder)
echo "󰉋"

##!/bin/bash
#
## Arguments: $1 = current_command, $2 = full_path
#CMD=$1
#PATH_NAME=$2
#BASENAME=$(basename "$PATH_NAME")
#
## 1. Check by Command (highest priority)
#case "$CMD" in
#*nvim* | *vim*) echo "" && exit ;;
#*python*) echo "" && exit ;;
#*node*) echo "󰎙" && exit ;;
#*rust* | *cargo*) echo "" && exit ;;
#*go*) echo "" && exit ;;
#*gcc* | *g++*) echo "" && exit ;;
#esac
#
## 2. Check by Folder Name (matches VS Code folder icons)
#case "$BASENAME" in
#.config) echo "" && exit ;;
#src | source) echo "󰜔" && exit ;;
#git | .git) echo "󰊢" && exit ;;
#bin | sbin) echo "󰆧" && exit ;;
#downloads) echo "󰇚" && exit ;;
#documents) echo "󱔗" && exit ;;
#pictures) echo "󰉏" && exit ;;
#videos) echo "󰈫" && exit ;;
#node_modules) echo "󰎙" && exit ;;
#.tmux) echo "" && exit ;;
#esac
#
## 3. Check for specific files inside the folder (Deep Detection)
#if [ -f "$PATH_NAME/package.json" ]; then echo "󰎙" && exit; fi
#if [ -f "$PATH_NAME/Cargo.toml" ]; then echo "" && exit; fi
#if [ -f "$PATH_NAME/main.py" ]; then echo "" && exit; fi
#if [ -d "$PATH_NAME/.git" ]; then echo "󰊢" && exit; fi
#
## Default fallback
#echo "󰉋"
