#!/bin/sh

## USER_GIT : your login
## Add your epitech login between the quotes
## For exemple :
## USER_GIT="surname.name@epitech.eu"
USER_GIT="@epitech.eu"

## PASSWORD : your password
## Add your epitech password between the quotes
## For exemple :
## PASSWORD="password"
PASSWORD=""

SEND_PASS="`echo -n "$PASSWORD" | sha512sum | cut -f1 -d' '`"

echo "Prepare my repo v2.0 by Armindster"
if [ $# -ge 1 ]
then
    blih -u $USER_GIT -t $SEND_PASS repository create $1
    blih -u $USER_GIT -t $SEND_PASS repository setacl $1 ramassage-tek r
    for arg
    do
        if [ "$arg" != "$1" ]
        then
            blih -u $USER_GIT -t $SEND_PASS repository setacl $1 $arg rwa
        fi
    done
    git clone git@git.epitech.eu:/$USER_GIT/$1
else
    echo $0" [Dépot à créer] [Utilisateur à ajouter (0 à n)]"
fi
