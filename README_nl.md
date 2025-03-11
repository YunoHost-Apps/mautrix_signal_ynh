<!--
NB: Deze README is automatisch gegenereerd door <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Hij mag NIET handmatig aangepast worden.
-->

# Matrix Signal bridge voor Yunohost

[![Integratieniveau](https://apps.yunohost.org/badge/integration/mautrix_signal)](https://ci-apps.yunohost.org/ci/apps/mautrix_signal/)
![Mate van functioneren](https://apps.yunohost.org/badge/state/mautrix_signal)
![Onderhoudsstatus](https://apps.yunohost.org/badge/maintained/mautrix_signal)

[![Matrix Signal bridge met Yunohost installeren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_signal)

*[Deze README in een andere taal lezen.](./ALL_README.md)*

> *Met dit pakket kun je Matrix Signal bridge snel en eenvoudig op een YunoHost-server installeren.*  
> *Als je nog geen YunoHost hebt, lees dan [de installatiehandleiding](https://yunohost.org/install), om te zien hoe je 'm installeert.*

## Overzicht

A puppeting bridge between Matrix and Signal packaged as a YunoHost service. Messages, notifications (and sometimes media) are bridged between a Signal user and a Matrix user.
Currently the Matrix user can NOT invite other Matrix user in a bridged Signal room, so only someone with a Signal account can participate to Signal group conversations.

The ["Mautrix-Signal"](https://docs.mau.fi/bridges/go/signal/index.html) bridge consists in a Synapse App Service and relies on postgresql (mysql also possible). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.


**Geleverde versie:** 0.8.0~ynh1
## Documentatie en bronnen

- Officiele gebruikersdocumentatie: <https://docs.mau.fi/bridges/go/signal/index.html>
- Upstream app codedepot: <https://github.com/mautrix/signal>
- YunoHost-store: <https://apps.yunohost.org/app/mautrix_signal>
- Meld een bug: <https://github.com/YunoHost-Apps/mautrix_signal_ynh/issues>

## Ontwikkelaarsinformatie

Stuur je pull request alsjeblieft naar de [`testing`-branch](https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing).

Om de `testing`-branch uit te proberen, ga als volgt te werk:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
of
sudo yunohost app upgrade mautrix_signal -u https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
```

**Verdere informatie over app-packaging:** <https://yunohost.org/packaging_apps>
