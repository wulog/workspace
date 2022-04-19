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
  dir=($(ls -d plugins/*))
  dir+=( client cmd engine )
  for i in ${!dir[@]}; do
    D=${dir[$i]}
    cd $D
    git add .
    git commit -m "update"
    git push
    cd -
  done
}

function init(){
  dir=($(ls -d plugins/*))
  dir+=( client cmd engine )
  for i in ${!dir[@]}; do
    D=${dir[$i]}
    cd $D
    git add .
    git commit -m "init"
    git branch -M main
    if [[ $D =~ "/" ]]; then   
      git remote add origin git@github.com:wulog/plugin-${D##*/}.git
    else
      git remote add origin git@github.com:wulog/$D.git
    fi
    git push -u origin main
    cd -
  done
}

# tmp=${a#*_}   # remove prefix ending in "_"
# b=${tmp%_*}   # remove suffix starting with "_"
update_repo