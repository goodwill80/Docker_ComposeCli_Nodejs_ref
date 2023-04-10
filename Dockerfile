# BASE IMAGE - grab from docker repo with matching dependencies
# Default commands always - FROM, RUN, CMD
FROM node:alpine

# DEFAULT WORK FOLDER IN CONTAINER - DOCKER WILL CREATE IF NOT FOUND
WORKDIR '/app'

# COPY PACKAGE.JSON FILE INTO CONTAINER 
# Do this 1st so that that docker will only rebuild if we make changes to the package.json
# Image won't be rebuild if there are changes to source code, saving build time
COPY package.json .
# RUN DEFAULT COMMAND TO DOWNLOAD FILE SYSTEM B$ CAPTURING AS AN IMAGE IN CACHE
RUN npm install
# THEN COPY THE REST OF THE FILE SYSTEM
COPY . .

# ADD IN THE DEFAULT COMMANDS TO CONTAINER AND CAPTURE IT AS AN IMAGE
CMD ["npm", "start"]