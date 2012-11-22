# -*- coding: utf-8 -*-

"""
springpad_client.py

A [Springpad Client](https://github.com/springpad/springpad/tree/master/python)
extension to allow some extra operations easily.
"""
from settings import *
from spring import Client
import json
import re
from ConfigParser import ConfigParser
import os
from oauth import oauth

class SpringpadClient(Client):
    """
    Client from Springpad extension
    """

    def springit(self, block):
        """
        Springs a block to Springpad by means of `/springit` POST operation
        from Springpad API.
        """
        self._fetch('springit', method='POST', post_data=json.dumps(block))

    def get_notebooks(self):
        """
        Get notebooks related information as a list of dictionaries.
        """
        user_info = self.get_user('me')
        uuid_s = re.match('/UUID\((.*?)\)/', user_info['systemData']).groups()[0]
        system_block_data = self._fetch('users/me/blocks/{0}'.\
                format(uuid_s), method='GET')
        return system_block_data['properties']['workbooks']

    def spring_note(self, title, text, tags=None, uuid=None):
        """
        Publish a note to springpad.
        args:
            title: a title for the note (the note's name).
            text: the note body (HTML code will be parsed on Springpad website)
            tags: a list of tags
            uuid: the uuid of an existent note if it would like to be updated
                instead of created.
        """
        block = {'type': u'/Type(Note)/', 'name': title,
                    'properties': {'text': text}}
        if tags:
            block['tags'] = tags
        if uuid:
            block['uuid'] = uuid
        self.springit(block)

def auth_springpad_client(config_file=None):
    """
    Auth the application to make to be allowed to access to user's springpad
    account. If not a valid config file is provided it will prompt the user to
    visit an url in order to allow the application to access to its account
    and it will store authentication details in `config_file`.
    args:
        config_file: the configuration file path to be used. If it is not
            provided, '~/.springpad' will be used instead.
    returns: SpringpadClient instance to interact with the authenticated
        account.
    """
    config_file = config_file or os.path.expanduser('~/.springpad')
    config = ConfigParser()
    config.read([config_file])
    token = config.get('access', 'token') if config.has_option('access', 'token')\
                else None
    if token:
        token = oauth.OAuthToken.from_string(token)

    client = SpringpadClient(SPRINGPAD_CONSUMER_KEY, SPRINGPAD_CONSUMER_PRIVATE, token)

    if not client.access_token:
        req_token = client.get_request_token()
        print 'Please grant access to your springpad account in the following url:\n'
        print 'http://springpad.com/api/oauth-authorize?{0}\n'.format(req_token)
        print 'Once authorized, press intro to continue:',
        raw_input()
        client.access_token = client.get_access_token(req_token)
        config.add_section('access')
        config.set('access', 'token', str(client.access_token))
        with open(os.path.expanduser(config_file), 'w') as cf:
            config.write(cf)
    return client

