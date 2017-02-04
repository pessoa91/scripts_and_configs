#!/bin/bash

setxkbmap -query | grep variant | grep -q neo && setxkbmap us || setxkbmap de neo

