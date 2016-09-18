#!/bin/bash

folder=$(dirname $1)
extension=${1##*.}

feh -. $folder/*.$extension
