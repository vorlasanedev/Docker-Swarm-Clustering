# Use Node.js version 20
# FROM node:20-alpine

FROM node:lts-alpine

ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
# Install production dependencies
RUN npm install --production --silent
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 9100
RUN chown -R node /usr/src/app
USER node
CMD ["node", "app.js"]
