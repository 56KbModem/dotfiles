#!/bin/bash

# set up ssh-agent:
eval "$(ssh-agent -s)";
# add private-key:
ssh-add ~/.ssh/56KbModem;
