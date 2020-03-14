#!/bin/bash

setxkbmap -query | grep variant | grep -q neo && setxkbmap de || setxkbmap de neo

