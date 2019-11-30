#!/bin/zsh

SCRIPTDIR="$(dirname "$(readlink "$0")")"
source "$SCRIPTDIR"/git-config-variables.sh

echo "Your name?"
read NAME

echo "Your email? 1) Personal, 2) Work, or type it"
read EMAIL


# Set default emails
if [[ "$EMAIL" -eq "1" ]]; then
	EMAIL=$EMAIL1
elif [[ "$EMAIL" -eq "2" ]]; then
	EMAIL=$EMAIL2
fi

echo "Configuring git user..."
echo ""

git config user.name $NAME
git config user.email $EMAIL

echo "New user name:"
git config user.name
echo ""

echo "New user email:"
git config user.email

echo "git commit --amend --reset-author ? (y/N)"
read RESET

if [ "$RESET" = "y" ]
	then
		git commit --amend --reset-author
fi
