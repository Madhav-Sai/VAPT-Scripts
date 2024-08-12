#!/bin/bash
KEY_ID="identitity@key.com"
if ! gpg --list-keys | grep uid | grep -q "${KEY_ID}"; then 
    echo "Could not find identity/key ID ${KEY_ID}"
    exit 1 
fi 

while read -r passpharse; do 
    echo "Brute forccing with ${passpharse}..."
    if echo "${passpharse}" | gpg --batch \ 
                                    --yes \
                 --pinentry-mode loopback \
                        --passphrase-fd 0 \
                    --output private.pgp \
                                 --armor \
      --export-secret-key "${KEY_ID}"; then
      echo "Passphrase is: ${passphrase}"
 echo "Private key is located at private.pgp"
 exit 0
 fi
done < passphrases.txt
                                    
