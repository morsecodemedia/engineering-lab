#!/usr/bin/env bash

################################################################################
# Git
#
# Shell ergonomics for Git.
################################################################################

alias gb="git branch"
alias gs="git status"

gitfetchall() {
  git_workflow_fetch_all
}

gsum() {
  git_workflow_summary
}