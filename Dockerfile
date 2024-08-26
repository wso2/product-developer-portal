FROM node:22.0.0
USER root
#WORKDIR /app
COPY package.json ./
RUN npm install

#RUN rm /node_modules/devportal-webapp/config.js

WORKDIR /node_modules/devportal-webapp
#COPY src/ /node_modules/devportal-webapp/
EXPOSE 3000

ENTRYPOINT ["npm", "start"]
