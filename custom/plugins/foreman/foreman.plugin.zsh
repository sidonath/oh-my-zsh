alias fs="foreman start"
alias fr="foreman run"

# The following is based on https://github.com/gma/bundler-exec

#bundled_commands=(annotate cap capify cucumber ey foreman guard heroku middleman nanoc rackup rainbows rails rake rspec ruby shotgun spec spork thin thor unicorn unicorn_rails)
# removed 'foreman, heroku' from the list
foreman_commands=(annotate bundle cap capify cucumber ey guard middleman nanoc rackup rainbows rails rake rspec ruby shotgun spec spork thin thor unicorn unicorn_rails)

## Functions

_foreman-installed() {
  which foreman > /dev/null 2>&1
}

_within-foreman-project() {
  local check_dir=$PWD
  while [ $check_dir != "/" ]; do
    [ -f "$check_dir/.env" ] && return
    check_dir="$(dirname $check_dir)"
  done
  false
}

_run-with-foreman() {
  if _foreman-installed && _within-foreman-project; then
    foreman run "$@"
  else
    $@
  fi
}

## Main program
for cmd in $foreman_commands; do
  eval "function foreman_$cmd () { _run-with-foreman \"$cmd \$@\"}"
  alias $cmd=foreman_$cmd

  if which _$cmd > /dev/null 2>&1; then
        compdef _$cmd foreman_$cmd=$cmd
  fi
done
