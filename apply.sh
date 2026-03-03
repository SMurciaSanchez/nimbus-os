#!/bin/sh
# =============================================================
# NIMBUS OS - Configuracion de Usuario
# Edita este archivo para personalizar tu entorno
# =============================================================

REPO_DIR="/tmp/nimbus"
LOG="/var/log/nimbus-bootstrap.log"
log() { echo "[apply] $(date '+%H:%M:%S') $1" | tee -a "$LOG"; }

log "Aplicando configuracion de usuario..."

[ -f "$REPO_DIR/config/.bashrc" ] && cp "$REPO_DIR/config/.bashrc" /root/.bashrc
[ -f "$REPO_DIR/config/.vimrc" ]  && cp "$REPO_DIR/config/.vimrc"  /root/.vimrc

apk add --no-cache vim htop tmux wget net-tools 2>/dev/null

cat >> /root/.profile << 'EOF'
export LANG=es_ES.UTF-8
alias ll='ls -la'
alias cls='clear'
alias gs='git status'
EOF

log "Configuracion aplicada OK"
