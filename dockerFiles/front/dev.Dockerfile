FROM node:alpine

WORKDIR /usr/src/app

COPY ./front/package*.json .

COPY ./front/yarn* .

RUN yarn install

COPY ./front .

CMD [ "yarn", "start" ]