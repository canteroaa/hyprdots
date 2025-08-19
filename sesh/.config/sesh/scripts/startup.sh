#!/usr/bin/env bash

#Nombre de la sesion actual
session_name=$(tmux display-message -p '#S')

#Renombrar la ventana actual
tmux rename-window " code"
tmux send-keys -t " code" 'clear' C-m
tmux send-keys -t " code" 'nvim' C-m

# Crear otra ventana llamada "bd" y ejecutar "new_tigo"
tmux new-window -n " bd"
tmux send-keys -t " bd" 'clear' C-m

# Iniciando Base de datos dependiendo de que session sea
if [ "$session_name" = "Tigo" ]; then
  tmux send-keys -t " bd" 'new_tigo' C-m
elif [ "$session_name" = "Personal" ]; then
  tmux send-keys -t " bd" 'personal' C-m
elif [ "$session_name" = "Mcdonalds" ]; then
  tmux send-keys -t " bd" 'bd_mcdonalds' C-m
elif [ "$session_name" = "Jedi-panel" ]; then
  tmux send-keys -t " bd" 'bd_bolivia' C-m
elif [ "$session_name" = "Mc-wsgateway" ]; then
  tmux send-keys -t " bd" 'bd_mcdonalds' C-m
elif [ "$session_name" = "Telecom" ]; then
  tmux send-keys -t " bd" 'sudo ip route add 192.168.2.0/24 dev ppp0' C-m
fi

# Crear otra ventana "logs"
tmux new-window -n "󱂅 logs"
tmux send-keys -t "󱂅 logs" 'cd storage/logs' C-m
tmux send-keys -t "󱂅 logs" 'clear' C-m

# Ejecutar la vpn si la sesion es de momopersonal
if [ "$session_name" = "Personal" ]; then
  tmux new-window -n " vpn"
  tmux send-keys -t " vpn" 'clear' C-m
  tmux send-keys -t " vpn" 'vpn' C-m
elif [ "$session_name" = "Telecom" ]; then
  tmux new-window -n " vpn"
  tmux send-keys -t " vpn" 'clear' C-m
  tmux send-keys -t " vpn" 'vpn' C-m
fi

# Volver a la ventana "code"
tmux select-window -t " code"
