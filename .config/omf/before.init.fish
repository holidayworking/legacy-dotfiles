if [ -x /usr/libexec/path_helper ]
  eval (env PATH='' /usr/libexec/path_helper -c | sed 's/[:"]/ /g')
end
set -gx PATH $HOME/.nodebrew/current/bin $HOME/bin $PATH

set -gx EDITOR vim

set -gx GOPATH $HOME

if test (uname) = Linux
  set -gx RBENV_ROOT $HOME/.rbenv
end
