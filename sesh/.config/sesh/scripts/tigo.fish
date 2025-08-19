#!/usr/bin/env fish

# Nombre de la sesión
set SESSION_NAME tigo

# Directorio raíz del proyecto (usando expansión de variables de fish)
set PROJECT_ROOT (echo $HOME/Documentos/Unnaki/Proyectos/TIGOmomopy/web-tigo)

# Crear la sesión de tmux si no existe
tmux new-session -d -s $SESSION_NAME -c $PROJECT_ROOT

# Renombrar la primera ventana
tmux rename-window -t $SESSION_NAME:1 " code"

# Crear una segunda ventana para la base de datos
tmux new-window -t $SESSION_NAME:2 -n " bd"
tmux send-keys -t $SESSION_NAME:2 "cd $PROJECT_ROOT" Enter
tmux send-keys -t $SESSION_NAME:2 clear Enter
tmux send-keys -t $SESSION_NAME:2 new_tigo Enter

# Crear una tercera ventana para los logs
tmux new-window -t $SESSION_NAME:3 -n "󱂅 logs"
tmux send-keys -t $SESSION_NAME:3 "cd $PROJECT_ROOT/storage/logs" Enter
tmux send-keys -t $SESSION_NAME:3 clear Enter

# Volver a la primera ventana y abrir nvim
tmux select-window -t $SESSION_NAME:1
tmux send-keys -t $SESSION_NAME:1 clear Enter
tmux send-keys -t $SESSION_NAME:1 nvim Enter

# Conectar a la sesión (cambiar a ella si ya estamos dentro de tmux)
if test -z "$TMUX"
    tmux attach-session -t $SESSION_NAME
else
    tmux switch-client -t $SESSION_NAME
end
