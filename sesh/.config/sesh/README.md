# Instrucciones para instalar Sesh

- Correr el comando: 

```bash
go install github.com/joshmedeski/sesh@latest
```

- Añadir el path del binario a fish

```bash
set -Ux fish_user_paths (go env GOPATH)/bin $fish_user_paths
```


