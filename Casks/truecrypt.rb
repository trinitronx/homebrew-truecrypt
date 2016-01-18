cask 'truecrypt' do
  version '7.1a'
  sha256 '04db58b737c05bb6b0b83f1cb37a29edec844b59ff223b9e213ee1f4e287f586'

  name 'truecrypt'
  url "https://github.com/DrWhax/truecrypt-archive/raw/master/TrueCrypt%20#{version}%20Mac%20OS%20X.dmg"
  # mirror "https://www.grc.com/misc/truecrypt/TrueCrypt%20#{version}%20Mac%20OS%20X.dmg"
  gpg "#{url}.sig",
      :key_id => 'c5f4bac4a7b22db8b8f85538e3ba73caf0d6b1e0'

  homepage 'https://www.grc.com/misc/truecrypt/truecrypt.htm'
  license :oss

  preflight do
    # Due to an incorrect version check in TrueCrypt's installer, we need to patch it to install on OS X > 10.10
    # Reference:
    #   http://tips.tinyiron.net/yosemite-to-truecrypt-never-gonna-get-it/
    truecrypt_installer_yosemite_patch = <<-EOPATCH.undent
    --- a/TrueCrypt 7.1a.mpkg/Contents/distribution.dist\t2012-02-07 02:42:11.000000000 -0700
    +++ b/TrueCrypt 7.1a.mpkg/Contents/distribution.dist\t2015-07-05 20:54:56.000000000 -0600
    @@ -10,7 +10,7 @@
     
     
     function pm_install_check() {
    -  if(!(system.version.ProductVersion >= '10.4.0')) {
    +  if(system.compareVersions(system.version.ProductVersion, '10.4.0') &lt; 0) {
         my.result.title = 'Error';
         my.result.message = 'TrueCrypt requires Mac OS X 10.4 or later.';
         my.result.type = 'Fatal';
    @@ -105,4 +105,4 @@
         <pkg-ref id="com.github.osxfuse.pkg.Core" installKBytes="3076" version="2.3.8.10.6" auth="Root">file:./Contents/Packages/OSXFUSECore.pkg</pkg-ref>
         <pkg-ref id="com.google.macfuse.core" installKBytes="60" version="2.3.8.10.6" auth="Root">file:./Contents/Packages/OSXFUSEMacFUSE.pkg</pkg-ref>
         <pkg-ref id="com.google.macfuse" installKBytes="652" version="2.0" auth="Root">file:./Contents/Packages/MacFUSE.pkg</pkg-ref>
    -</installer-script>
    \\ No newline at end of file
    +</installer-script>
    EOPATCH

    patch_file_path = File.join( staged_path, 'TrueCrypt7.1a_Installer_Yosemite_Fix.patch')
    File.open( patch_file_path, 'w' ) do |patch_file|
      patch_file.write( truecrypt_installer_yosemite_patch )
      patch_file.close
    end

    system_command '/bin/sh',
      :args => [ '-c', "cd #{staged_path} && patch -p1 < #{patch_file_path}"]
  end

  pkg "TrueCrypt #{version}.mpkg"

  uninstall :pkgutil => 'org.TrueCryptFoundation.TrueCrypt'

  caveats do
    files_in_usr_local
    discontinued
    <<-EOS.undent
    Phase 2 of the TrueCrypt Audit FINISHED!
    No significant cryptographic problems found
    Yes ... TrueCrypt is still safe to use.

    TrueCrypt Development has been halted, however the 3rd party audit has completed.
    Please see the following URL for details:

      http://istruecryptauditedyet.com/
    EOS
  end
end
