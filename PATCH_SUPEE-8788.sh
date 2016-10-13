#!/bin/bash


# What is the version number?
version=`php -r "require 'app/Mage.php'; echo Mage::getVersion();"`
echo "Magento version:" $version
naked_version="${version//\./}"


# Which patch file do we need?
if [ $naked_version -ge 1500 -a $naked_version -lt 1510 ]; then
	filename="1.5.0.1"
elif [ $naked_version -ge 1510 -a $naked_version -lt 1600 ]; then
	filename="1.5.1.0"
elif [ $naked_version -ge 1600 -a $naked_version -lt 1610 ]; then
	filename="1.6.0.0"
elif [ $naked_version -ge 1610 -a $naked_version -lt 1620 ]; then
	filename="1.6.1.0"
elif [ $naked_version -ge 1620 -a $naked_version -lt 1700 ]; then
	filename="1.6.2.0"
elif [ $naked_version -ge 1700 -a $naked_version -lt 1701 ]; then
	filename="1.7.0.0"
elif [ $naked_version -ge 1701 -a $naked_version -lt 1702 ]; then
	filename="1.7.0.1"
elif [ $naked_version -ge 1702 -a $naked_version -lt 1800 ]; then
	filename="1.7.0.2"
elif [ $naked_version -ge 1800 -a $naked_version -lt 1810 ]; then
	filename="1.8.0.0"
elif [ $naked_version -ge 1810 -a $naked_version -lt 1900 ]; then
	filename="1.8.1.0"
elif [ $naked_version -ge 1900 -a $naked_version -lt 1901 ]; then
	filename="1.9.0.0"
elif [ $naked_version -ge 1901 -a $naked_version -lt 1911 ]; then
	filename="1.9.0.1"
elif [ $naked_version -ge 1910 -a $naked_version -lt 1920 ]; then
	filename="1.9.1.1"
elif [ $naked_version -ge 1920 -a $naked_version -lt 1921 ]; then
	filename="1.9.2.0"
elif [ $naked_version -ge 1921 -a $naked_version -lt 1922 ]; then
	filename="1.9.2.1"
elif [ $naked_version -ge 1922 -a $naked_version -lt 1923 ]; then
	filename="1.9.2.2"
elif [ $naked_version -ge 1923 -a $naked_version -lt 1924 ]; then
	filename="1.9.2.3"
elif [ $naked_version -ge 1924 -a $naked_version -lt 1930 ]; then
	filename="1.9.2.4"
else
	filename="no-version"
fi;


# Download the right patch.
if [ $filename != "no-version" ]; then
	patch_file="PATCH_SUPEE-7405_CE_"$filename"_v1.sh"
	echo "Download patch: $patch_file"
	wget --no-check-certificate --quiet - https://raw.githubusercontent.com/rikwillems/SUPEE-7405/master/$patch_file
else 
	echo "Version not supported for patch."
	exit;
fi;


# Disable and clear compiler for ease of use.
echo "Disable compiler:"
php -f shell/compiler.php disable

echo "Clear compiler:"
php -f shell/compiler.php clear
