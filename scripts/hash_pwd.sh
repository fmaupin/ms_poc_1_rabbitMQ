#!/bin/bash

PWD_HEX=$(echo -n $1 | xxd -p)

SALT="908D C60A" 
HEX="$SALT $PWD_HEX"

SHA256=$(echo -n $HEX | xxd -r -p | sha256sum)

# password généré à insérer dans le fichier definitions.json - users / password_hash
echo "908D C60A $SHA256" | xxd -r -p | base64 
