#!/bin/bash

sudo apt install -y mailutils
sudo apt install -y ssmtp

# sudo cp ./ssmtp.conf /etc/ssmtp
#echo "This email body" | mail -s "This is subject" <your recipient email>

# check /var/log/mail.err if there is error
# check https://myaccount.google.com/security if there is blocking from gmail
# turn on less secure app access https://www.google.com/settings/security/lesssecureapps