# Stage 1: Build
FROM node:16-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --no-audit --no-fund && npm cache clean --force
COPY public/ ./public
COPY src/ ./src
RUN npm run build

# Stage 2: Serve with Nginx
FROM nginx:stable-alpine
COPY entrypoint.sh /entrypoint.sh
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN chmod +x /entrypoint.sh
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]