#!/bin/sh

echo "Your name?"
read NAME

echo "Your email? 1) Personal, 2) Work, or type it"
read EMAIL

# Set default emails
if [ "$EMAIL" == "1" ]
	then
		EMAIL=$EMAIL1
elif [ "$EMAIL" == "2" ]
	then
		EMAIL=$EMAIL2
fi

echo "Configuring git user..."
echo ""

git config user.name $NAME
git config user.email $EMAIL

echo "User name:"
git config user.name
echo ""

echo "User email:"
git config user.email

echo "git commit --amend --reset-author ? (y/N)"
read RESET

if [ "$RESET" === "y"]
	then
		git commit --amend --reset-author
fi
