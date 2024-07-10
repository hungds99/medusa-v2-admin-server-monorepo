FROM node:22-alpine

# Create app directory
WORKDIR /app

# Set up yarn package manager
RUN corepack enable
RUN yarn set version stable

# Install app dependencies
COPY package*.json yarn.lock .yarnrc.yml ./

RUN yarn install --frozen-lockfile

# Bundle app source
COPY . .

# Build the app
RUN yarn build

EXPOSE 9000
CMD [ "yarn", "start" ]