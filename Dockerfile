FROM node:8.12.0-alpine as builder

RUN apk update
RUN apk add yarn git

COPY . .
RUN npm run setup
RUN npm run production

FROM nginx:1.15.3-alpine

COPY --from=builder dist/. /usr/share/nginx/html

EXPOSE 80
