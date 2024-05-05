#!/bin/bash

# Before running: create a library file using the Calibre app.

/Applications/calibre.app/Contents/MacOS/calibredb --with-library ./library add -m overwrite -1 ./output/books/*
