export PS1='\[\033[1;36m\][nimbus]\[\033[0m\] \u@\h:\w\$ '
export LANG=es_ES.UTF-8
alias ll='ls -la --color=auto'
alias cls='clear'
alias gs='git status'

echo ""
echo "  NIMBUS OS - Sistema Efimero Stateless"
echo "  ======================================="
echo "  RAM  : $(free -m | awk '/Mem:/{print $3}') MB usados / $(free -m | awk '/Mem:/{print $2}') MB"
echo "  IP   : $(ip route get 1 2>/dev/null | grep -o 'src [0-9.]*' | awk '{print $2}')"
echo "  WARN : Todo desaparece al apagar"
echo ""
