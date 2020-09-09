#using Node v10
FROM node:10

#Create app directory
WORKDIR /usr/src/lafs

#install app dependencies
#a wildcard is used to ensure both package.json AND package-lock.json are copied
#where available(npm@5+)
COPY package*.json ./

RUN npm install
#if you are building your code for production
#RUN npm ci --only=production

#bundle app source
COPY . .

#expose port 3000 outside container
EXPOSE 3000
#Command used to start application
CMD ["node", "server/server.js"]