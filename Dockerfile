FROM node:14 as BUILD

# Create app directory
WORKDIR /usr/src/app

# Add pruning packages for use later.
RUN curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh | bash -s -- -b /usr/local/bin

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Prune the source code.
RUN npm prune --production
RUN /usr/local/bin/node-prune

COPY . .

# Build final image using small base image.
FROM node:14-alpine

WORKDIR /usr/src/app

COPY --from=BUILD /usr/src/app /usr/src/app

# Set permissions for node app folder after copy.
RUN chown -R node:root /usr/src/app/
RUN chmod -R 775 /usr/src/app/

# Switch to node user.
USER node

EXPOSE 9000

# Image start commands.
ENTRYPOINT [ "npm" ]
CMD [ "start" ]
