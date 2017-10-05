function fish_title
  echo $argv[1]
end

function peco_select_history
  if test (count $argv) = 0
    set peco_flags
  else
    set peco_flags --query "$argv"
  end

  history | peco $peco_flags | read foo

  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end

function peco-ssh
  grep "Host " ~/.ssh/config | cut -d \  -f 2 | peco | read hostname

  if [ $hostname ]
    ssh $hostname
  end
end
alias ssh-peco peco-ssh

eval (hub alias -s)
