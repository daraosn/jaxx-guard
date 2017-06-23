jaxx-guard
==========

Jaxx is one of the simplest and most popular crossplatform cryptocurrency wallets.

While very convenient to use it for ShapeShift between the currencies it supports, it has been target of criticism due to very poor security (only a 4 number PIN code to decrypt the 12-word key).

The most recent and critial way to hack came to light recently, and it demonstrate how it's very easy to extract the key when the wallet is installed on Chrome or as a Desktop app:
https://vxlabs.com/2017/06/10/extracting-the-jaxx-12-word-wallet-backup-phrase/

I have been researching for some time already and was aware of some vulnerabilities. In an effort to help protect users, I decided to release this simple and small utility.

It contains two scripts:

protect.sh
----------

This scripts encodes the local storage for the Jaxx Desktop and Chrome Extension. It uses AES-128-CBC security, which I believe is superior than a simple 4-Digital PIN.

Run the script from the directory like `./protect.sh`

It will request a password and a confirmation. The wallet will be protected.

In order to properly protect, please close Chrome/Jaxx before running the script. Afterwards when you open Chrome/Jaxx, the wallet will show up as new, but in the background your wallet has been encrypted.

restore.sh
----------

This script decodes the local storage.

Run the script from the directory like `./restore.sh`

It will request the preset password and will decode the wallet.

Again, remember to close Chrome/Jaxx before running the script. The wallet will be restored and will show up.

DISCLAIMER
==========

BEFORE RUNNING THIS SCRIPT ENSURE THAT YOU HAVE SAVED YOUR 12-WORD KEY, WHILE I HAVE TESTED IT AND BEEN USING IT ALREADY FOR SOME TIME, I TAKE NO RESPONSIBILITY FOR BUGS OR ERRORS THAT MAY HAPPEN.
USE 100% AT YOUR OWN RISK.

TODO
====

This currently supports only OSX, but if there is enough interest I might port it to other platforms and maybe create a plugin/app.

LICENSE
=======

MIT - 2017 Diego Araos <d@wehack.it>
