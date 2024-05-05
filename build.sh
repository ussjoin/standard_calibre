#!/bin/bash

# Before running, prerequisites:
# brew install cairo git openjdk pipx python@3.11 parallel
# pipx ensurepath
# sudo ln -sfn $(brew --prefix)/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# pipx install --python python3.11 standardebooks

# -b: build the Kobo version
# -k: build the Kindle AZW3 version

# {} is a GNU parallel-ism: it says "sub in the argument here." I use it twice, once to provide
# a particular output directory (to create one directory per book) and once to give the
# se build command something to build.

# This will create a folder ./output/books/ which contains folders for each book.

export COLUMNS; parallel --keep-order se build -b -k -o output/{} {} ::: ./books/*

