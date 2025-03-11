FROM node:16-alpine

WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# Install Nest CLI globally so the 'nest' command is available
RUN npm install -g @nestjs/cli

# Copy the rest of your application code
COPY . .

# Build the application
RUN npm run build

EXPOSE 3000

CMD [ "node", "dist/main.js" ]
