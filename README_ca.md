<!--
N.B.: Aquest README ha estat generat automàticament per <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NO s'ha de modificar manualment.
-->

# Matrix Signal bridge per YunoHost

[![Nivell d'integració](https://apps.yunohost.org/badge/integration/mautrix_signal)](https://ci-apps.yunohost.org/ci/apps/mautrix_signal/)
![Estat de funcionament](https://apps.yunohost.org/badge/state/mautrix_signal)
![Estat de manteniment](https://apps.yunohost.org/badge/maintained/mautrix_signal)

[![Instal·la Matrix Signal bridge amb YunoHosth](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_signal)

*[Llegeix aquest README en altres idiomes.](./ALL_README.md)*

> *Aquest paquet et permet instal·lar Matrix Signal bridge de forma ràpida i senzilla en un servidor YunoHost.*  
> *Si no tens YunoHost, consulta [la guia](https://yunohost.org/install) per saber com instal·lar-lo.*

## Visió general

A puppeting bridge between Matrix and Signal packaged as a YunoHost service. Messages, notifications (and sometimes media) are bridged between a Signal user and a Matrix user.
Currently the Matrix user can NOT invite other Matrix user in a bridged Signal room, so only someone with a Signal account can participate to Signal group conversations.

The ["Mautrix-Signal"](https://docs.mau.fi/bridges/go/signal/index.html) bridge consists in a Synapse App Service and relies on postgresql (mysql also possible). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.


**Versió inclosa:** 0.8.1~ynh1
## Documentació i recursos

- Documentació oficial per l'usuari: <https://docs.mau.fi/bridges/go/signal/index.html>
- Repositori oficial del codi de l'aplicació: <https://github.com/mautrix/signal>
- Botiga YunoHost: <https://apps.yunohost.org/app/mautrix_signal>
- Reportar un error: <https://github.com/YunoHost-Apps/mautrix_signal_ynh/issues>

## Informació per a desenvolupadors

Envieu les pull request a la [branca `testing`](https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing).

Per provar la branca `testing`, procedir com descrit a continuació:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
o
sudo yunohost app upgrade mautrix_signal -u https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
```

**Més informació sobre l'empaquetatge d'aplicacions:** <https://yunohost.org/packaging_apps>
