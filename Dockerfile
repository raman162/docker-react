FROM node:8.12-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 443
COPY --from=builder /app/build /usr/share/nginx/html
