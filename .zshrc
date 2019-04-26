# NOTE this file is sourced on closing within .vim_my_functions/.functions-and-commands
# NOTE .git/hooks/... is where post commit hooks live
# NOTE show running background tasks with jobs, fg % [task no]

# NOTE - take branch, branch that, and take master, and branch that, merge the
# two then merge everything...?
# see "cd_and_chill" in functions - writes last directory
cd $(cat ~/.last_dir)
alias ld="cd $(cat ~/.last_dir)"

# Tells me whether I need to pull
git status -uno

zsh_source_files=(~/.zsh_my_settings/.*)

for source_file in $zsh_source_files
do
  source $source_file
done

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TODO print branch?
# TODO copy from zsh to vim register (for CD)?
# TODO look into ZSH traps - allows for contingent arguments on background jobs
  # ... presumably can background jobs entirely (ie all output to /dev/null)
  # except on triggers - saves the faff of tmux

# TODO open in windows with o . (.functions) --> pain in the arse come back to
# Needs, like, some thought

# TODO run the below weekly?
# antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh
# antibody update
# source ~/.zsh_plugins.sh

alias inst="npm install --save-dev"

