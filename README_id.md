<!--
N.B.: README ini dibuat secara otomatis oleh <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Ini TIDAK boleh diedit dengan tangan.
-->

# Matrix Signal bridge untuk YunoHost

[![Tingkat integrasi](https://apps.yunohost.org/badge/integration/mautrix_signal)](https://ci-apps.yunohost.org/ci/apps/mautrix_signal/)
![Status kerja](https://apps.yunohost.org/badge/state/mautrix_signal)
![Status pemeliharaan](https://apps.yunohost.org/badge/maintained/mautrix_signal)

[![Pasang Matrix Signal bridge dengan YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=mautrix_signal)

*[Baca README ini dengan bahasa yang lain.](./ALL_README.md)*

> *Paket ini memperbolehkan Anda untuk memasang Matrix Signal bridge secara cepat dan mudah pada server YunoHost.*  
> *Bila Anda tidak mempunyai YunoHost, silakan berkonsultasi dengan [panduan](https://yunohost.org/install) untuk mempelajari bagaimana untuk memasangnya.*

## Ringkasan

A puppeting bridge between Matrix and Signal packaged as a YunoHost service. Messages, notifications (and sometimes media) are bridged between a Signal user and a Matrix user.
Currently the Matrix user can NOT invite other Matrix user in a bridged Signal room, so only someone with a Signal account can participate to Signal group conversations.

The ["Mautrix-Signal"](https://docs.mau.fi/bridges/go/signal/index.html) bridge consists in a Synapse App Service and relies on postgresql (mysql also possible). Therefore, [Synapse for YunoHost](https://github.com/YunoHost-Apps/synapse_ynh) should be installed beforehand.


**Versi terkirim:** 0.7.5~ynh2
## Dokumentasi dan sumber daya

- Dokumentasi pengguna resmi: <https://docs.mau.fi/bridges/go/signal/index.html>
- Depot kode aplikasi hulu: <https://github.com/mautrix/signal>
- Gudang YunoHost: <https://apps.yunohost.org/app/mautrix_signal>
- Laporkan bug: <https://github.com/YunoHost-Apps/mautrix_signal_ynh/issues>

## Info developer

Silakan kirim pull request ke [`testing` branch](https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing).

Untuk mencoba branch `testing`, silakan dilanjutkan seperti:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
atau
sudo yunohost app upgrade mautrix_signal -u https://github.com/YunoHost-Apps/mautrix_signal_ynh/tree/testing --debug
```

**Info lebih lanjut mengenai pemaketan aplikasi:** <https://yunohost.org/packaging_apps>
