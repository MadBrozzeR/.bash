parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ \1 /p'
}

BLUE_GREY="\001\033[0;44;37m\002"
YELLOW_BLACK="\001\033[0;43;30m\002"
LIBLUE_BLACK="\001\033[0;46;30m\002"
PURPLE="\001\033[0;35m\002"
CLEAR=$'\001\033[0m\002'

get_user() {
  echo -e $BLUE_GREY" $1 "
}

get_workdir() {
  DIR=${1/${HOME}/\~}
  echo -e $YELLOW_BLACK" $DIR "
}

get_branch() {
  echo -e $LIBLUE_BLACK"$(parse_git_branch)"
}

ARROW_TOP=$'\001\033[0;35m\002\xE2\x94\x8C'
ARROW_BOTTOM=$'\001\033[0;35m\002\xE2\x94\x94'

PS1=$'\n${ARROW_TOP}$(get_user \u)$(get_workdir \w)$(get_branch)${CLEAR}'\
$'\n${ARROW_BOTTOM}${CLEAR} '
