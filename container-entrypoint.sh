#!/bin/bash
#
# ONLY RUN this script INSIDE the container
# Context: là thư mục chứa script này
#
ROOT_DIR=/home/upibo

echo "Install python requirements ..."
cd $ROOT_DIR

# echo "Install lib..."
# apt-get -y install build-essential python3-dev python3-pip python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info

# echo "Install requirements..."
# pip install -r requirements.txt

export SECRET_KEY='dummy'

# python manage.py migrate

# npm install
# npm audit fix
# npm rebuild node-sass
# npm run build-assets
# npm run build-emails

# #
# # Chi chay lan dau cac lan khac comment lai dong nay
# #
# python manage.py populatedb --createsuperuser
#

#
# apt-get install libgif-dev -> install gif lib
#
echo "Start worker..."
nohup uwsgi saleor/wsgi/uwsgi.ini >> /dev/null &

# Keep container running
tail -f /dev/null
