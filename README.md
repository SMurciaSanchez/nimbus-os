<h1 align="center">☁️ Nimbus OS</h1>

<p align="center">
  <strong>Sistema Linux diskless en RAM para operaciones catastrales</strong><br>
  <em>Caso de uso: Alcaldía Municipal de Chía</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Alpine%20Linux-0D597F?style=for-the-badge&logo=alpinelinux&logoColor=white" />
  <img src="https://img.shields.io/badge/VirtualBox-183A61?style=for-the-badge&logo=virtualbox&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-Provisioning-181717?style=for-the-badge&logo=github&logoColor=white" />
</p>

---

## 📋 Descripción

Nimbus OS es un sistema operativo **diskless** basado en Alpine Linux que corre
completamente en RAM dentro de VirtualBox. Diseñado como modelo operativo para
la gestión catastral de la Alcaldía de Chía, enfatizando velocidad, seguridad
y reproducibilidad.

## 🎯 Características principales

- ⚡ **Ejecución 100% en RAM** — sin persistencia en disco, sistema efímero por diseño
- 🔄 **Aprovisionamiento vía GitHub** — configuración versionada y reproducible
- 🌐 **Red configurada desde arranque** — bootstrap automatizado
- 🔒 **Seguridad por efemeralidad** — cada reinicio restaura un estado limpio

## 🏗️ Arquitectura técnica
# Nimbus OS

**Sistema Operativo Efimero Stateless** - Alpine Linux en RAM pura, sin discos.

## Arquitectura de Boot Automatico

```
ISO arranca
    |
    v
initramfs Alpine
    |
    +-> detecta eth0
    |
    +-> DHCP -> IP asignada       (red PRIMERO - rompe el ciclo huevo/gallina)
    |
    +-> descarga apkovl desde URL (este repositorio via jsDelivr)
    |
    +-> aplica overlay -> /etc/local.d/ disponible
    |
    +-> ejecuta 00-bootstrap.start
            |
            +-> setup-keymap es es
            +-> apk add git curl
            +-> git clone nimbus-os
            +-> apply.sh
```

## Estructura del Repositorio

```
nimbus-os/
├── alpine-efimero.apkovl.tar.gz   # Overlay que carga el initramfs de Alpine
├── apply.sh                        # Configuracion de usuario (editar aqui)
├── etc/
│   └── local.d/
│       └── 00-bootstrap.start      # Script de boot automatico
└── config/
    ├── .bashrc                     # Shell personalizado
    └── .vimrc                      # Editor
```

## Verificar que el sistema es stateless

```sh
df -h | grep -v tmpfs   # No debe aparecer ningun /dev/sd*
cat /var/log/nimbus-bootstrap.log
```

## Personalizar

Edita `apply.sh` para agregar paquetes o configuraciones adicionales.
Cada reboot aplicara los cambios automaticamente desde GitHub.
