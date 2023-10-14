#!/bin/sh

# let's decorate plain text with colors -- in regexp :(
chromohelp() {
  sed \
    -e $'s/^\\([[:space:]]*\\[\\)\\([^](]*\\)/\\1\e[34m\\2\e[0m/g' \
    -e $'s/\\([[(\'[:space:]]\\)\\(-[^-[:space:]][^][),;=[:space:]]*\\)/\\1\e[36m\\2\e[0m/g' \
    -e $'s/^\\([[:space:]]\\{1,10\\}\\)\\([a-z][^]),;=[:space:]]*\\)/\\1\e[32m\\2\e[0m/g' \
    -e $'s/\\(--[^][,;=[:space:]]*\\)/\e[34m\\1\e[0m/g' \
    -e $'s/\\(\\[\\|[(=<>[:space:]]\\|^\\)\\([_A-Z0-9][-_A-Z0-9]\\+\\)\\(\\]\\|[),;=<>[:space:]]\\|\$\\)/\\1\e[33m\\2\e[0m\\3/g' \
    -e $'s/\\(\\[\\|[(,;=<>[:space:]]\\|^\\)\\([_A-Z0-9][-_A-Z0-9]\\+\\)\\(\\]\\|[\\.),;=<>[:space:]]\\|\$\\)/\\1\e[33m\\2\e[0m\\3/g' \
    -e $'s/\\(<[^<>]\\+>\\)/\e[35m\\1\e[0m/g' \
    -e $'s/\\([-\\.[:alnum:]]\\+\@[-\\.[:alnum:]]\\+\\.[[:alpha:]]\\+\\)/\e[35m\\1\e[0m/g' \
    -e $'s/\\(e\\. \\?g\\.\\)/\e[32m\\1\e[0m/g'
}

# a shorthand
:c() {
  $*|chromohelp
}
