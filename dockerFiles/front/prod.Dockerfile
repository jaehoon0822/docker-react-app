FROM node:alpine as builder

WORKDIR /usr/src/app

COPY ./front/package*.json .

COPY ./front/yarn* .

RUN yarn install

COPY ./front .

RUN yarn build

FROM nginx

COPY --from=builder /usr/src/app/build /usr/share/nginx/html