gi () { curl -L -s https://www.gitignore.io/api/$@ }

githubCount () {
  DEST=/tmp/temp-linecount-repo
  git clone --depth 1 "$1" $DEST &&
    cloc $DEST
        rm -rf temp-linecount-repo
}

ytAudio () {
  OLD=$PWD
  DEST=$YT_AUDIO_DEST
  cd $DEST
  mkdir $1
  cd $1
  youtube-dl -f bestaudio $2
  cd $OLD
}

wave2mp3 () {
  ffmpeg -i $1 -vn -ar 44100 -ac 2 -ab 192k -f mp3 $1.mp3
}

installed_compiler () {
  # Parse pacman output and determine compiler
  for I in `pacman -Q | awk '{ print $1 }'`; do
    IS_COMPILER=`pacman -Qi $I | egrep -i "compil"`
    if [ ! "${IS_COMPILER}" = "" ]; then echo $I; fi
  done
}

gcom () {
  git commit -m "$(git branch | awk '/^\*/ { print $2   }'), $argv"
}

gcount () {
  git ls-files | xargs wc -l
}

gcurl () {
  curl -i -X GET $1
}

pcurl () {
  # usage like pcurl localhost:8080 'param1=value1&param2=value2'
  curl -i -X POST --data $2 $1
}

ginit () {
  git init && \
    git add -A && \
    git commit -m "Initialize repository"
}

# glog () {
#   git log --pretty=format:"%h %ad %Cgreen %s %Creset  [%an]" --graph --date=short
# }

last_installed () {
  echo "$(expac --timefmt='%Y-%m-%d %T' '%l\\t%n' | sort | tail -n $1)"
}

make_world_readable () {
  find $1 -type d -exec chmod 755 {} \;
  find $1 -type f -exec chmod 644 {} \;

  if [ -d $1/.git/hooks ]; then
    chmod +x -R $1/.git/hooks
  fi

  if [ -d $1/bin ]; then
    chmod +x -R $1/bin
  fi

  if [ -d $1/exe ]; then
    chmod +x -R $1/exe
  fi

  if [ -d $1/docker/helper ]; then
    chmod +x -R $1/docker/helper
  fi
}

mdC () {
  pandoc -s $argv.md -o $argv.pdf && zathura $argv.pdf
}

p1ng () {
  ping archlinux.org -c 1
}

paclsexplicit () {
  pacman -Qet
}

qr () {
  qrencode $1 -o /tmp/qr.png
  feh -ZF /tmp/qr.png && rm /tmp/qr.png
}

swirl () {
  grep -swirl $1
}

V () {
  vim $(ls -p | grep -v /)
}

vimCommit () {
  vim $(git diff-tree --no-commit-id --name-only -r $1)
}

weather () {
  curl 'https://wttr.in/$1'
}

xmod () {
  chmod +x $1
}
