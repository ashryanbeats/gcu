# Git user config script

This bash shell script makes it possible to set the following on a per-repo basis:

```
git config user.name
git config user.email
```

This is for GitHub users that use two or more GitHub accounts and need to set each local repo's user info depending upon the GitHub account they intend to push to.

## Setup

1. `git clone` this repo to wherever you store your scripts (ex. `/usr/local/bin`)
1. Add a new file (I'll use the example filename `git-config-variables.sh` going forward) to the newly created directory with the following contents:

   ```
   #!/bin/sh

   EMAIL1="me@my-email.com"
   EMAIL2="me-again@my-email.com"
   ```

1. Make the files executable (`chmod u+x git-config-variables.sh git-config.sh`)
1. Add the local repo's directory to the `$PATH` (this makes it possible for the last line of `git-config-variables.sh` to work)

Optionally, make an alias in your shell rc file (`~/.bashrc` or `~/.zshrc`) for convenience. I use `gcu` (for `git config user.xyz`).

## Script flow

### User input

The script will ask you two questions:

- "Your name?"
- "Your email? 1) <EMAIL_NAME_1>, 2) <EMAIL_NAME_2>, or type it"

For the second question, if you simply enter `1`, the variable `EMAIL1` from `git-config-variables.sh` will be used. Likewise, if you enter `2`, `EMAIL2` will be used.

Otherwise, if you type an email address, it will be used as the user email.

### Commands run

After you answer, the script will then run:

```
git config user.name <FIRST_ANSWER>
git config user.email <SECOND_ANSWER>
```

### Script output

After running the commands, the script will show you the output from `git config user.name` and `git config user.email` to visually verify that your input was received.

## FAQ

### How do I correct a mistake if I type something wrong?

Just run the script again.

### Why are the email addresses in a separate file (ex. `git-config-variables.sh`)?

Because I wanted to put the script on GitHub without exposing the email addresses I use.

If you want to hardcode your email addresses into the main script, there's no harm in doing so.

### Can I have more than two email address options to choose from?

Absolutely! Just edit the script to make that happen.

It should be somewhat clear how to do that based on the code that's already there. Or you can ask me.
