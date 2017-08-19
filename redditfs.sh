#!/bin/bash
cd ~/.local/bin
git clone https://github.com/ianpreston/redditfs.git
cd redditfs && virtualenv env && source env/bin/activate
pip install -r reqs.txt
mkdir /r
python redditfs.py /r
