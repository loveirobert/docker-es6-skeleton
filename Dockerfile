# Pull base image.
FROM nodesource/trusty:4.2.6

RUN npm install npm@3 -g
RUN npm --version
RUN npm install pm2 -g 2>&1; exit 0

COPY express-es6-skeleton /usr/src/app/
# ADD express-es6-skeleton/package.json /usr/src/package.json;
# RUN npm install;
EXPOSE 3000
WORKDIR /usr/src/app
# RUN pm2 start bin/www;
# RUN npm install;
CMD /bin/bash
