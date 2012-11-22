# -*- coding: utf-8 -*-

"""
settings.py
"""

# Springpad developer keys
SPRINGPAD_CONSUMER_KEY = ''
SPRINGPAD_CONSUMER_PRIVATE = ''

try :
    from settings_dev import *
except ImportError :
    pass
