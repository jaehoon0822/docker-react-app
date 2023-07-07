FROM node:alpine

WORKDIR /usr/src/app

COPY ./back/package*.json .

COPY ./back/yarn* .

RUN yarn install

COPY ./back .

EXPOSE 8080

CMD ["yarn", "dev:start"]