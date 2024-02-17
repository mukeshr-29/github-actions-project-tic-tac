FROM node:16-alpine as build
WORKDIR /app
COPY package*.json .
COPY . .
RUN npm install
RUN npm run build

FROM node:16-alpine
WORKDIR /app
COPY --from=build /app /app/
EXPOSE 3000
CMD ["npm", "start"]

