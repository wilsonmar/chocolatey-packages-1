﻿$packageName = 'ruby.portable'

# 1.8.7
#$url = 'http://dl.bintray.com/oneclick/rubyinstaller/ruby-1.8.7-p374-i386-mingw32.7z?direct'
#$checksum = '2eabeb3bb210d088083c0c04fdf94c7e'

# 1.9.3
# $url = 'http://dl.bintray.com/oneclick/rubyinstaller/ruby-1.9.3-p551-i386-mingw32.7z?direct'
# $checksum = '73ba6e292d3afec5cecc68ec64fd85bf'

# 2.0.0
$url = 'http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.0.0-p598-i386-mingw32.7z?direct'
$checksum = 'a4b7f5c3d3286b51ea35d34fde8aa174'
$url64 = 'http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.0.0-p598-x64-mingw32.7z?direct'
$checksum64 = '011b3832b6e557e7b25fd98821e28e69'

# 2.1.5
#$url = 'http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.1.5-i386-mingw32.7z?direct'
#$checksum = 'fe6b596fc47f503b0c0c01ebed16cf65'
#$url64 = 'http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.1.5-x64-mingw32.7z?direct'
#$checksum64 = '2ebc791db99858a0bd586968cddfcf0d'

try {
  $toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $installDir = Join-Path $toolsDir "ruby"


  $file = Join-Path $toolsDir "$($packageName).7z"
  #Get-ChocolateyWebFile "$packageName" "$file" "$url" -checksum "$checksum"
  Get-ChocolateyWebFile "$packageName" "$file" "$url" "$url64" -checksum "$checksum" -checksum64 "$checksum64"

  Get-ChocolateyUnzip "$file" "$installDir" -packageName "$packageName"

  Write-ChocolateySuccess $packageName
} catch {
  Write-ChocolateyFailure $packageName $($_.Exception.Message)
  throw
}
