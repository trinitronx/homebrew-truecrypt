# Truecrypt 7.1a Homebrew Tap  [![Build Status](https://travis-ci.org/trinitronx/homebrew-truecrypt.png?branch=master)](https://travis-ci.org/trinitronx/homebrew-truecrypt) [![Gratipay](http://img.shields.io/gratipay/trinitronx.svg)](https://www.gratipay.com/trinitronx)

This tap is designed specifically for installing the last available working & [audited][5] build of Truecrypt, version: 7.1a

**NOTE:** As of macOS Catalina (10.15), 32-bit apps are no longer supported.  Therefore, Truecrypt has been obsoleted.  Please migrate to [VeraCrypt](https://www.veracrypt.fr/en/Home.html) which supports 64-bit. VeraCrypt is based on TrueCrypt 7.1a and is currently maintained.

To install VeraCrypt, the Truecrypt replacement: `brew cask install veracrypt`

## Installation

First, make sure you have installed [`homebrew-cask`](http://caskroom.io/) if you haven't yet:

    brew install caskroom/cask/brew-cask

Then, run the following in your command-line:

    brew tap trinitronx/homebrew-truecrypt

## Usage

**Note**: For info run:

    brew cask info truecrypt

Once the tap is installed, you can install `truecrypt`!

    brew cask install truecrypt

## Sponsor

If you find this project useful and appreciate my work,
would you be willing to click one of the buttons below to Sponsor this project and help me continue?

- <noscript><a href="https://github.com/sponsors/trinitronx">:heart: Sponsor</a></noscript>
- <noscript><a href="https://liberapay.com/trinitronx/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a></noscript>
- <noscript><a href="https://paypal.me/JamesCuzella"><img src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" alt="Donate with PayPal" /></a></noscript>

Every little bit is appreciated! Thank you! 🙏

## Testing

To test Truecrypt's internal encryption/decryption algorithms:

    /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt --text --test

To test volume creation:

    /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt --text --create  --encryption=AES --hash=SHA-512 --filesystem=FAT -k '' --password=test123 --size=500000 --random-source=/dev/urandom --volume-type=normal /tmp/testvolume.tc

To test mounting the volume:

    /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt --text -k '' --password=test123 --protect-hidden=no --mount /tmp/testvolume.tc /Volumes/testvolume
    [ -e /Volumes/testvolume/ ] && echo 'PASS' || echo 'FAIL'

To test dismounting the volume:

    /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt --text --dismount /tmp/testvolume.tc /Volumes/testvolume
    rm /tmp/testvolume.tc

## Is Truecrypt still safe to use?

### TLDR;

As long as you use a good password, and ensure good random seed data... **YES!**

### 3rd Party Audit

Since the original developer's strange disappearing act and unsubstantiated claim that it was unsafe, it has now gone through [an official 3rd party audit][1], and has come away with an overall clean bill of health.

Only a couple very minor flaws were found as reported on multiple news & blog sites:

 - [ArsTechnica][2]
 - [The Register][3]
 - [Cryptography Engineering Blog][4]
 - [Is TrueCrypt Audited Yet][5]
 - [GRC][6]

As mentioned the largest potential flaw found was an unlikely special case where the Windows Crypto API _may_ fail and TrueCrypt would not issue a security warning, but overall the other flaws found are minor and the consensus is that it's still safe to use.  Perhaps the best thing that happened to TrueCrypt is that the author abandoned it... for it gave reason for people to take notice & actually give it an audit.  We now have enough conclusive evidence to reasonably determine it is safe to use to provide sufficient protection for sensitive data.

[1]: https://opencryptoaudit.org/reports/iSec_Final_Open_Crypto_Audit_Project_TrueCrypt_Security_Assessment.pdf
[2]: http://arstechnica.com/security/2015/04/truecrypt-security-audit-is-good-news-so-why-all-the-glum-faces/
[3]: http://www.theregister.co.uk/2015/04/02/truecrypt_security_audit/
[4]: http://blog.cryptographyengineering.com/2015/04/truecrypt-report.html
[5]: http://istruecryptauditedyet.com/
[6]: https://www.grc.com/misc/truecrypt/truecrypt.htm

## Credits

Credit for the base formula comes from https://github.com/caskroom/homebrew-unofficial/blob/1f3022e6706e8ea45b98630c8d077a27d094075c/Casks/truecrypt.rb




[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/trinitronx/homebrew-truecrypt/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

