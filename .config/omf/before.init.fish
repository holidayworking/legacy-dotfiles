if [ -x /usr/libexec/path_helper ]
  eval (env PATH='' /usr/libexec/path_helper -c | sed 's/[:"]/ /g')
end

set -gx EDITOR vim

set -gx GOPATH $HOME

if test (uname) = Linux
  set -gx RBENV_ROOT $HOME/.rbenv
  set -gx NODENV_ROOT $HOME/.nodenv
end
