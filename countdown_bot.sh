#!/bin/bash
#
# just run countdown_bot.rb
#
cd /usr/src/app
if [ $? -eq 0 ];	then
	ruby countdown_bot.rb
fi
