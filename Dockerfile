FROM node:16-alpine as build
WORKDIR /app
COPY package*.json .
RUN npm run install
COPY . .
RUN npm run build

FROM node:16-alpine
WORKDIR /app
COPY --from=build /app /app/
EXPOSE 3000
CMD ["npm", "start"]