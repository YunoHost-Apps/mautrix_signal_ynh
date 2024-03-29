<!--
N.B.: Questo README è stato automaticamente generato da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON DEVE essere modificato manualmente.
-->

# Matrix Signal bridge per YunoHost

[![Livello di integrazione](https://dash.yunohost.org/integration/mautrix_signal.svg)](https://dash.yunohost.org/appci/app/mautrix_signal) ![Stato di funzionamento](https://ci-apps.yunohost.org/ci/badges/mautrix_signal.status.svg) ![Stato di manutenzione](https://ci-apps.yunohost.org/ci/badges/mautrix_signal.maintain.svg)

[![Installa Matrix Signal bridge con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_signal)

*[Leggi questo README in altre lingue.](./ALL_README.md)*

> *Questo pacchetto ti permette di installare Matrix Signal bridge su un server YunoHost in modo semplice e veloce.*  
> *Se non hai YunoHost, consulta [la guida](https://yunohost.org/install) per imparare a installarlo.*

## Panoramica

A puppeting bridge between Matrix and Signal packaged as a YunoHost service. Messages, notifications (and sometimes media) are bridged between a Signal user and a Matrix user. Currently the Matrix user can NOT invite other Matrix user in a bridged Signal room, so only someone with a Signal account can participate to Signal group conversations. The ["Mautrix-Signal"](https://docs.mau.fi/bridges/python/signal/index.html) bridge consists in a Synapse App Service and relies on postgresql (mysql also possible). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.


**Versione pubblicata:** 0.4.3~ynh1
## Attenzione/informazioni importanti

## List of known public services

* Ask on one of the following rooms: #mautrix_yunohost:matrix.fdn.fr or #signal:maunium.net

## Bridging usage
** Note that several Signal and Matrix users can be bridged, each Signal account has its own bot administration room. If they are in a same Signal group, only one matrix room will be created. **

### Bridge a Signal user and a Matrix user
* First your Matrix user or Synapse Server has to be authorized in the Configuration of the bridge (see below)
* Then, invite the bot (default @signalbot:yoursynapse.domain) in this new Mautrix-Signal bot administration room.
  * If the Bot does bot accept, see the [troubleshooting page](https://docs.mau.fi/bridges/general/troubleshooting.html)
* Send ``!sg help`` to the bot in the created room to know how to control the bot.
See also [upstream wiki Authentication page](https://docs.mau.fi/bridges/python/signal/authentication.html)

#### Linking the Bridge as a secondary device
* Type ``!sg link``
* Open Signal App of your primary device
* Open Settings => Linked Devices => + => Capture the QR code with the camera
* By defaults, only conversations with very recent messages will be bridged
* Accept invitations to the bridged chat rooms

#### Registering the Bridge as a primary device
* Type ``!sg register <phone>``, where ``<phone>`` is your phone number in the international format with no space, e.g. ``!sg register +33612345678``
* Answer in the bot room with the verification code that you reveived in SMS.
* Set a profile name with ``!sg set-profile-name <name>``

### Double puppeting
* Log in with ``login-matrix <access token>``
* After logging in, the default Matrix puppet of your Signal account should leave rooms and your account should join all rooms the puppet was in automatically.


### Relaybot: Bridge a group for several Matrix and several Signal users to chat together
* Create a room on the signal side
* Your bridged users will be invited on the Matrix side once they are invited on the Signal side
* You can invite more people over on the Matrix side
* Have one of the bridged users (who has the right permission) type `!sg set-relay` on the Matrix side. Their signal account will relay messages from other Matrix users
It is not yet possible to bridge to an existing signal room, or create a new signal room from the Matrix side.

## Configuration of the bridge

The bridge is [roughly configured at installation](https://github.com/YunoHost-Apps/mautrix_signal_ynh/blob/master/conf/config.yaml), e.g. allowed admin and user of the bot. Finer configuration can be done by modifying the
following configuration file with SSH: 
```/opt/yunohost/mautrix_signal/config.yaml```
and then restarting the mautrix_signal service.

## Documentation

 * Official "Mautrix-Signal" documentation: https://docs.mau.fi/bridges/python/signal/index.html
 * Matrix room (Matrix Bridges in Yunohost): #mautrix_yunohost:matrix.fdn.fr
 * Matrix room (upstream app): #signal:maunium.net
In case you need to upload your logs somewhere, be aware that they contain your contacts' and your phone numbers. Strip them out with 
``| sed -r 's/[0-9]{10,}/📞/g' ``
 * "Mautrix-Signal" bridge is based on the [signal daemon](https://gitlab.com/signald/signald) project.
 * YunoHost documentation: If more specific documentation is needed, feel free to contribute.

## YunoHost specific features

#### Multi-user support

* Bot users are not related to Yunohost users. Any Matrix account or Synapse server autorized in the configuration of the bridge can invite/use the bot. 
* The Signal bot is a local Matrix-Synapse user, but accessible through federation (synapse public or private).
* Several Signal and Matrix users can be bridged with one bridge, each user has its own bot administration room. 
* If several bot users are in a same Signal group, only one Matrix room will be created by the bridge.
* See https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support

#### Multi-instance support

* Multi-instance installation should work. Several bridge instances could be installed for one Matrix-Synapse instance so that one Matrix user can bridge several Signal accounts. 
* Several bridge instances could be installed for each Matrix-Synapse instance to benefit from it. But one bridge can be used by users from several Matrix-Synapse instances.

## Limitations

* It looks like media are not bridged. 
* Signal chats are not grouped in a Matrix community (as opposed to the Mautrix-WhatsApp or Mautrix-Facebook bridges)

## Documentazione e risorse

- Documentazione ufficiale per gli utenti: <https://docs.mau.fi/bridges/python/signal/index.html>
- Repository upstream del codice dell’app: <https://github.com/mautrix/signal>
- Store di YunoHost: <https://apps.yunohost.org/app/mautrix_signal>
- Segnala un problema: <https://github.com/YunoHost-Apps/mautrix_signal_ynh/issues>

## Informazioni per sviluppatori

Si prega di inviare la tua pull request alla [branch di `testing`](https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing).

Per provare la branch di `testing`, si prega di procedere in questo modo:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
o
sudo yunohost app upgrade mautrix_signal -u https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
```

**Maggiori informazioni riguardo il pacchetto di quest’app:** <https://yunohost.org/packaging_apps>
