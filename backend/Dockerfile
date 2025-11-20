FROM node:20-alpine
WORKDIR /app

# Copy package files first for dependency install
COPY package*.json ./

# Use npm install when package-lock.json is not present; omit dev dependencies in CI builds
RUN npm install --omit=dev

# Copy application source
COPY . .

EXPOSE 3001
CMD ["node", "server.js"]
