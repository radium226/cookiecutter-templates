#!/bin/bash

git init . 
git add --all
git commit -m "Initializing repository"

make poetry-install