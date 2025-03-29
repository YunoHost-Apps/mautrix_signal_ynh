<!--
N.B.: Diese README wurde automatisch von <https://github.com/YunoHost/apps/tree/master/tools/readme_generator> generiert.
Sie darf NICHT von Hand bearbeitet werden.
-->

# Matrix Signal bridge für YunoHost

[![Integrations-Level](https://apps.yunohost.org/badge/integration/mautrix_signal)](https://ci-apps.yunohost.org/ci/apps/mautrix_signal/)
![Funktionsstatus](https://apps.yunohost.org/badge/state/mautrix_signal)
![Wartungsstatus](https://apps.yunohost.org/badge/maintained/mautrix_signal)

[![Matrix Signal bridge mit YunoHost installieren](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_signal)

*[Dieses README in anderen Sprachen lesen.](./ALL_README.md)*

> *Mit diesem Paket können Sie Matrix Signal bridge schnell und einfach auf einem YunoHost-Server installieren.*  
> *Wenn Sie YunoHost nicht haben, lesen Sie bitte [die Anleitung](https://yunohost.org/install), um zu erfahren, wie Sie es installieren.*

## Übersicht

A puppeting bridge between Matrix and Signal packaged as a YunoHost service. Messages, notifications (and sometimes media) are bridged between a Signal user and a Matrix user.
Currently the Matrix user can NOT invite other Matrix user in a bridged Signal room, so only someone with a Signal account can participate to Signal group conversations.

The ["Mautrix-Signal"](https://docs.mau.fi/bridges/go/signal/index.html) bridge consists in a Synapse App Service and relies on postgresql (mysql also possible). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.


**Ausgelieferte Version:** 0.8.1~ynh1
## Dokumentation und Ressourcen

- Offizielle Benutzerdokumentation: <https://docs.mau.fi/bridges/go/signal/index.html>
- Upstream App Repository: <https://github.com/mautrix/signal>
- YunoHost-Shop: <https://apps.yunohost.org/app/mautrix_signal>
- Einen Fehler melden: <https://github.com/YunoHost-Apps/mautrix_signal_ynh/issues>

## Entwicklerinformationen

Bitte senden Sie Ihren Pull-Request an den [`testing` branch](https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing).

Um den `testing` Branch auszuprobieren, gehen Sie bitte wie folgt vor:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
oder
sudo yunohost app upgrade mautrix_signal -u https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
```

**Weitere Informationen zur App-Paketierung:** <https://yunohost.org/packaging_apps>
