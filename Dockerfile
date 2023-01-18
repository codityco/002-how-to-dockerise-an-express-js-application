FROM node:18 as build

WORKDIR /usr/src/private

COPY package*.json .

COPY . .

# stage 2

FROM node:18

WORKDIR /usr/src/app

COPY --from=build /usr/src/private /usr/src/app

EXPOSE 3000

ENTRYPOINT ["npm", "start"]