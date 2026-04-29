# Build
FROM node:16-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install

# Staging
FROM node:16-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json .
COPY --from=builder /app/src ./src
COPY --from=builder /app/public ./public
EXPOSE 3000
CMD ["npm", "start"]
