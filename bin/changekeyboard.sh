#!/bin/bash

[[ $(setxkbmap -query | grep variant | cut -f5 -d" ") == "neo" ]] && setxkbmap de || setxkbmap de neo

