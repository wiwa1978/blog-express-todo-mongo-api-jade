FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install build-essential
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN apt-get -y install git
RUN apt-get -y install git-core

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

EXPOSE 4000

CMD ["nodejs", "/usr/src/app/bin/www"]
