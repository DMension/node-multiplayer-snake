FROM mhart/alpine-node
  
COPY . /app

CMD npm install

CMD node /app/app.js

EXPOSE  3000
