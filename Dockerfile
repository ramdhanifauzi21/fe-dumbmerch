# Build
FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install

# Staging
FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app .
EXPOSE 3000
CMD ["npm", "start"]
