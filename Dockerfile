# Pull base image.
FROM nodesource/trusty:4.2.6
RUN npm install npm@3 -g
RUN npm --version
RUN npm install pm2 -g 2>&1; exit 0
EXPOSE 3000
WORKDIR /usr/src/app
CMD /bin/bash
