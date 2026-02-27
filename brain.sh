#!/bin/bash
# 1. Entrar a la carpeta
cd /home/hacker/second-brain || exit

echo "--- Inicio de respaldo: $(date) ---"

# 2. Hacer el commit y push en Git
if [[ -n $(/usr/bin/git status -s) ]]; then
  echo "Cambios detectados en Git. Subiendo..."
  /usr/bin/git add .
  /usr/bin/git commit -m "Auto-backup: $(date +'%Y-%m-%d %H:%M')"
  /usr/bin/git push origin main
else
  echo "No hay cambios nuevos en Git."
fi

# 3. Sincronizar con Google Drive
echo "Sincronizando con Google Drive..."
/usr/bin/rclone sync /home/hacker/second-brain gdrive:second-brain

echo "--- Respaldo finalizado con éxito ---"
echo ""
