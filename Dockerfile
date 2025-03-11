FROM node:16-alpine

WORKDIR /usr/src/app

# Copy package files first for caching
COPY package*.json ./

# Install dependencies (all of them if you need dev tools for build)
RUN npm install

# Copy the rest of your source code
COPY . .

# Build the application
RUN npm run build

# Optionally, prune dev dependencies if desired
RUN npm prune --production

EXPOSE 3000
CMD [ "node", "dist/main.js" ]
