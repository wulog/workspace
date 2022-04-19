#!/bin/sh


# for D in */; do
#   echo $D
#   cd $D
#   git add .
#   git commit -m "update"
#   git push
#   cd ..
# done

function update_repo() {
  for D in plugins/*; do
    cd $D
    git add .
    git commit -m "update"
    git push
    cd -
  done
}

function init(){
  for D in plugins/*; do
    cd $D
    git add .
    git commit -m "Update plugins"
    git branch -M main
    git remote add origin git@github.com:wulog/plugin-${D:8}.git
    git push -u origin main
    cd -
  done
}

update_repo