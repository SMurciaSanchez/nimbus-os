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
