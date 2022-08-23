# Initialize Instance
Quickly set up a new EC2 instance / bash terminal with custom aliases &amp; installs.

These default presets will make it easier to:
- Set up a new EC2 instance (Ubuntu)
- Set up a new Raspberry Pi (Ubuntu) 
- Set up a new PC with a Bash Terminal 
- Install packages I use regularly

---
## 1). Identify Our Bash Login File 
- Look for `.bashrc` or `.bash_profile` in terminal root directory:
  `ls -A`
  - If neither exist, create: `touch .bash_profile`
  - IF both exist, add: `echo '.FILENAME'` in both & reload terminal. Choose whatever runs first. 


## 2). Set Up / Add To `.bash_profile` or `.bashrc`
Edit: `sudo vim .bash_profile` or `sudo vim .bashrc`
   
```bash
# .bashrc example:


# If .bash_aliases exists, load into .bashrc
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# Set Vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"


# Aliases:

# Essentials
alias ..='cd ..'
alias la='ls -A'
alias cl='clear'
alias kip='sudo kill -9 $(sudo lsof -t -i:3000)' # Kill process running on port 3000
alias edit='cd; sudo vim /path/to/file' # Edit a commonly visited file. Ideal for NGINX .conf
alias hyp='cd; cd code/sandbox; code . hyp.js' # Launch a sandbox to test code hypotheses
alias run='cd; cd code/sandbox; node hyp.js' # Run those hypotheses

# Niche~
alias rpsql='postgres -u root' # Run psql 
alias rmysql='mysql -u root' # Run mysql
# mongosh # MongoDB cmd
# mongod # MongoDB cmd
alias coins='cd; node .coins.js' # Store/Log API Keys 

# PC Only
alias c='code .' # Launch current directory in VS Code
alias pi='cd; ssh pi@XXX.XXX.X.XXX' # SSH into raspberry pi
alias hypr='cd; cd code/sandbox/react; code . App.js' # Launch a react app sandbox
```

## 3). Installs:

```bash
# Before Installing Run:
sudo apt-get update && sudo apt-get upgrade -y

# node:
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash
sudo apt-get install -y nodejs
sudo apt-get install gcc g++ make

# nvm:
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash 

# git:
sudo apt-get install git

# vim: 
sudo apt install vim

# AFTER nvm INSTALL: set node to default version
nvm install 18
nvm alias default 18

# netstat: 
#  https://www.tecmint.com/install-netstat-in-linux/
apt install net-tools

# nginx: 
#  https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04
sudo apt install nginx

# mysql: 
#  https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04
sudo apt install mysql-server

# postgres: 
#  https://www.digitalocean.com/community/tutorials/how-to-install-postgresql-on-ubuntu-20-04-quickstart
sudo apt install postgresql postgresql-contrib

# mongodb: 
#  https://www.mongodb.com/docs/v5.0/tutorial/install-mongodb-on-ubuntu/
#   public keys
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add - 
#   create a list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list 
#   install mongoDB
sudo apt-get install -y mongodb-org 

# pm2: 
#  https://pm2.io/docs/runtime/guide/installation/
npm install pm2@latest -g

# TypeScript:
#  https://www.typescriptlang.org/download
npm install -g typescript

# ESLint:
#  https://eslint.org/docs/latest/user-guide/getting-started
npm install -g eslint
```

## 4). Set Up Git Config

`sudo vim .gitconfig`

```bash
# Fillout Your Own Name/Email
[user]
  name = John Doe
  emial = johndoe@example.com
[core]
  editor = vim
  autocrlf = input
  safecrlf = true
[alias] 
  co = checkout
  ci = commit
  st = status
  br = branch
  hist = log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short
  type = cat-file -t
  dump = cat-file -p
```

## 5). Store API Keys

`sudo vim .coins.js`

```js
/* Quickly Log API Keys <STORE AT YOUR OWN RISK> */

// [Purpose], Expires: [Exp. Date]
const KEY1 = 'abcdefghi...x  | [Purpose]';
// API Key for Running SDC, Expires: 9/21/22
const KEY2 = '123456789...0  | SDC';

console.log(KEY1);
console.log(KEY2);
...
```
