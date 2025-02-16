<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Matrix Signal bridge pour YunoHost

[![Niveau d’intégration](https://apps.yunohost.org/badge/integration/mautrix_signal)](https://ci-apps.yunohost.org/ci/apps/mautrix_signal/)
![Statut du fonctionnement](https://apps.yunohost.org/badge/state/mautrix_signal)
![Statut de maintenance](https://apps.yunohost.org/badge/maintained/mautrix_signal)

[![Installer Matrix Signal bridge avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_signal)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Matrix Signal bridge rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

Une passerelle entre Matrix et Signal empaquetée comme un service YunoHost. Les messages, médias et notifications sont relayées entre un compte Signal et un compte Matrix.

La passerelle ["Mautrix-Signal"](https://docs.mau.fi/bridges/python/signal/index.html) consiste en un Service d'Application Matrix-Synapse et repose sur une base-de-données postgresql. C'est pourquoi [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) doit être préalablemnet installé.

**Attention : sauvegardez et restaurez toujours les deux applications Yunohost matrix-synapse et mautrix_signal en même temps!**


**Version incluse :** 0.8.0~ynh1
## Documentations et ressources

- Documentation officielle utilisateur : <https://docs.mau.fi/bridges/go/signal/index.html>
- Dépôt de code officiel de l’app : <https://github.com/mautrix/signal>
- YunoHost Store : <https://apps.yunohost.org/app/mautrix_signal>
- Signaler un bug : <https://github.com/YunoHost-Apps/mautrix_signal_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
ou
sudo yunohost app upgrade mautrix_signal -u https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
