#!/usr/bin/python2.7

##############################################################################
# Global settings
##############################################################################

# Describes all the garage doors being monitored
GARAGE_DOORS = [
    {
        'pin': 40,
        'name': "GARAGE DOOR (HOME)",
        'alerts': [
            {
                'state': 'open',
                'time': 1,
                'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            }

        ]
    },

    {
        'pin': 40,
        'name': "REMINDER: Garage door",
        'alerts': [
            {
                'state': 'open',
                'time': 300,
		'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            },
            {
                'state': 'open',
                'time': 900,
                'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            },
            {
                'state': 'open',
                'time': 1800,
                'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            },            {
                'state': 'open',
                'time': 3600,
                'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            },
            {
                'state': 'open',
                'time': 5400,
                'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            },
            {
                'state': 'open',
                'time': 7200,
                'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            },
            {
                'state': 'open',
                'time': 7900,
		'recipients': [ 'email:9494603641@txt.att.net', 'email:6263767914@txt.att.net' ]
            }
        ]
    }
]

# All messages will be logged to stdout and this file
LOG_FILENAME = "/home/pi/log/pi_garage_alert.log"

##############################################################################
# Email settings
##############################################################################

SMTP_SERVER = 'localhost'
SMTP_PORT = 25
SMTP_USER = ''
SMTP_PASS = ''
EMAIL_FROM = 'HOME AUTOMATION <user@example.com>'

##############################################################################
# Twitter settings
##############################################################################

# Follow the instructions on http://talkfast.org/2010/05/31/twitter-from-the-command-line-in-python-using-oauth/
# to obtain the necessary keys

TWITTER_CONSUMER_KEY = ''
TWITTER_CONSUMER_SECRET = ''
TWITTER_ACCESS_KEY = ''
TWITTER_ACCESS_SECRET = ''

##############################################################################
# Twilio settings
##############################################################################

# Sign up for a Twilio account at https://www.twilio.com/
# then these will be listed at the top of your Twilio dashboard

TWILIO_ACCOUNT = ''
TWILIO_TOKEN = ''

# SMS will be sent from this phone number
TWILIO_PHONE_NUMBER = '+11234567890'

##############################################################################
# Jabber settings
##############################################################################

# Jabber ID and password that status updates will be sent from
# Leave this blank to disable Jabber support

JABBER_ID = ''
JABBER_PASSWORD = ''

# Uncomment to override the default server specified in DNS SRV records

#JABBER_SERVER = 'talk.google.com'
#JABBER_PORT = 5222

# List of Jabber IDs allowed to perform queries

JABBER_AUTHORIZED_IDS = []

##############################################################################
# Google Cloud Messaging settings
##############################################################################

GCM_KEY = ''
GCM_TOPIC = ''
