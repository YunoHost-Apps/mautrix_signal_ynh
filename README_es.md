<!--
Este archivo README esta generado automaticamente<https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
No se debe editar a mano.
-->

# Matrix Signal bridge para Yunohost

[![Nivel de integración](https://dash.yunohost.org/integration/mautrix_signal.svg)](https://ci-apps.yunohost.org/ci/apps/mautrix_signal/) ![Estado funcional](https://ci-apps.yunohost.org/ci/badges/mautrix_signal.status.svg) ![Estado En Mantención](https://ci-apps.yunohost.org/ci/badges/mautrix_signal.maintain.svg)

[![Instalar Matrix Signal bridge con Yunhost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_signal)

*[Leer este README en otros idiomas.](./ALL_README.md)*

> *Este paquete le permite instalarMatrix Signal bridge rapidamente y simplement en un servidor YunoHost.*  
> *Si no tiene YunoHost, visita [the guide](https://yunohost.org/install) para aprender como instalarla.*

## Descripción general

A puppeting bridge between Matrix and Signal packaged as a YunoHost service. Messages, notifications (and sometimes media) are bridged between a Signal user and a Matrix user.
Currently the Matrix user can NOT invite other Matrix user in a bridged Signal room, so only someone with a Signal account can participate to Signal group conversations.

The ["Mautrix-Signal"](https://docs.mau.fi/bridges/go/signal/index.html) bridge consists in a Synapse App Service and relies on postgresql (mysql also possible). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.


**Versión actual:** 0.6.3~ynh2
## Documentaciones y recursos

- Documentación usuario oficial: <https://docs.mau.fi/bridges/go/signal/index.html>
- Repositorio del código fuente oficial de la aplicación : <https://github.com/mautrix/signal>
- Catálogo YunoHost: <https://apps.yunohost.org/app/mautrix_signal>
- Reportar un error: <https://github.com/YunoHost-Apps/mautrix_signal_ynh/issues>

## Información para desarrolladores

Por favor enviar sus correcciones a la [`branch testing`](https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing

Para probar la rama `testing`, sigue asÍ:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
o
sudo yunohost app upgrade mautrix_signal -u https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
```

**Mas informaciones sobre el empaquetado de aplicaciones:** <https://yunohost.org/packaging_apps>
