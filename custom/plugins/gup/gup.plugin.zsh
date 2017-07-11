unalias gp

function git_branch() {
  git symbolic-ref --short HEAD 2>/dev/null
}

function has_tracking_branch() {
 git rev-parse --abbrev-ref @{u} > /dev/null 2>&1
}

function gp {
  for i in "$@"
  do
  case $i in
      -f|--force)
        echo "DO NOT USE -f or --force! If you really want to do it, use the full version."
        return -42
      ;;
      *)
      ;;
  esac
  done

  git push $(has_tracking_branch || echo "-u origin $(git_branch)")
}

alias gpthis='git push origin HEAD:$(git_branch)'
alias grb='git rebase -p'
alias gup='git fetch origin && grb origin/$(git_branch)'
alias gm='git merge --no-ff'
