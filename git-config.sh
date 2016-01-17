#!/bin/sh

echo "Your name?"
read NAME

echo "Your email? 1) ARB, 2) Adobe, or type it"
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