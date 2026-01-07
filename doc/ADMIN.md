## List of known public services

* Ask on one of the following rooms: `#mautrix_yunohost:matrix.fdn.fr` or `#signal:maunium.net`

## Bridging usage

**Note that several Signal and Matrix users can be bridged, each Signal account has its own bot administration room. If they are in a same Signal group, only one matrix room will be created.**

### Bridge a Signal user and a Matrix user

* First your Matrix user or Synapse Server has to be authorized in the Configuration of the bridge (see below)
* Then, invite the bot (default @signalbot:yoursynapse.domain) in this new Mautrix-Signal bot administration room.
  * If the Bot does bot accept, see the [troubleshooting page](https://docs.mau.fi/bridges/general/troubleshooting.html)
* Send ``!signal help`` to the bot in the created room to know how to control the bot.
See also [upstream wiki Authentication page](https://docs.mau.fi/bridges/go/signal/authentication.html)

#### Linking the Bridge as a secondary device

* Type ``!signal link``
* Open Signal App of your primary device
* Open Settings => Linked Devices => + => Capture the QR code with the camera
* By defaults, only conversations with very recent messages will be bridged
* Accept invitations to the bridged chat rooms

#### Registering the Bridge as a primary device

* Type ``!signal register <phone>``, where ``<phone>`` is your phone number in the international format with no space, e.g. ``!signal register +33612345678``
* Answer in the bot room with the verification code that you reveived in SMS.
* Set a profile name with ``!signal set-profile-name <name>``

### Double puppeting

* Log in with ``login-matrix <access token>``
* After logging in, the default Matrix puppet of your Signal account should leave rooms and your account should join all rooms the puppet was in automatically.

### Relaybot: Bridge a group for several Matrix and several Signal users to chat together

* Create a room on the signal side
* Your bridged users will be invited on the Matrix side once they are invited on the Signal side
* You can invite more people over on the Matrix side
* Have one of the bridged users (who has the right permission) type `!signal set-relay` on the Matrix side. Their signal account will relay messages from other Matrix users
It is not yet possible to bridge to an existing signal room, or create a new signal room from the Matrix side.

## Configuration of the bridge

The bridge is [roughly configured at installation](https://github.com/YunoHost-Apps/mautrix_signal_ynh/blob/master/conf/config.yaml), e.g. allowed admin and user of the bot. Finer configuration can be done by modifying the
following configuration file with SSH:
```/var/www/mautrix_signal/config.yaml```
and then restarting the mautrix_signal service.

## Documentation

* Official "Mautrix-Signal" documentation: <https://docs.mau.fi/bridges/go/signal/index.html>
* Matrix room (Matrix Bridges in Yunohost): #mautrix_yunohost:matrix.fdn.fr
* Matrix room (upstream app): #signal:maunium.net
In case you need to upload your logs somewhere, be aware that they contain your contacts' and your phone numbers. Strip them out with
```| sed -r 's/[0-9]{10,}/📞/g'```
* YunoHost documentation: If more specific documentation is needed, feel free to contribute.

## YunoHost specific features

### Multi-user support

* Bot users are not related to Yunohost users. Any Matrix account or Synapse server autorized in the configuration of the bridge can invite/use the bot.
* The Signal bot is a local Matrix-Synapse user, but accessible through federation (synapse public or private).
* Several Signal and Matrix users can be bridged with one bridge, each user has its own bot administration room.
* If several bot users are in a same Signal group, only one Matrix room will be created by the bridge.
* See <https://github.com/YunoHost-Apps/synapse_ynh#multi-users-support>

### Multi-instance support

* Multi-instance installation should work. Several bridge instances could be installed for one Matrix-Synapse instance so that one Matrix user can bridge several Signal accounts.
* Several bridge instances could be installed for each Matrix-Synapse instance to benefit from it. But one bridge can be used by users from several Matrix-Synapse instances.

## Limitations

* It looks like media are not bridged.
* Signal chats are not grouped in a Matrix community (as opposed to the Mautrix-WhatsApp or Mautrix-Facebook bridges)
