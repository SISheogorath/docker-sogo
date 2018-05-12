#!/bin/bash

cat >/etc/ssmtp/ssmtp.conf <<EOF
#
# Config file for sSMTP sendmail
#
# The person who gets all mail for userids < 1000
# Make this empty to disable rewriting.
root=postmaster

# The place where the mail goes. The actual machine name is required no
# MX records are consulted. Commonly mailhosts are named mail.domain.com
mailhub=${SSTMP_MAILSERVER}

# Where will the mail seem to come from?
#rewriteDomain=${SSMTP_DOMAIN}

# The full hostname
hostname=$HOSTNAME

# Are users allowed to set their own From: address?
# YES - Allow the user to specify their own From: address
# NO - Use the system generated From: address
FromLineOverride=YES

AuthUser=${SSMTP_AUTHUSER}
AuthPass=${SSMTP_AUTHPASS}
AuthMethod=LOGIN

UseTLS=YES
UseSTARTTLS=YES
EOF

exec $@
