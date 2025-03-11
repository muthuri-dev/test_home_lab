# Use an official Node.js runtime as a parent image
FROM node:16-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the rest of your application code
COPY . .

# Build the application (if you have a build step)
RUN npm run build

# Expose the port that your app listens on
EXPOSE 3000

# Define the command to run your app
CMD [ "node", "dist/main.js" ]