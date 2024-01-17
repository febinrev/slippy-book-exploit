#!/bin/bash

make_safe(){
if [[ $(unzip -l ${1} | grep -E "\.\./") ]]
then
echo "[x] Malicious EPUB Document detected"
printf "[+] Do you want to make it safe to open? [Y/N]: "
read ANSWER

if [[ ${ANSWER} == "Y" || ${ANSWER} == "y" ]]
then
sed -i s/"\.\.\/"/"__\/"/g ${1}
fi

else
echo "[+] Safe!"

fi
}

if [[ $(file -b ${1}) == "EPUB document" ]]
then
make_safe ${1}
else
echo "Not an EPUB document"

fi 



