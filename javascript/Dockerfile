FROM node:6
RUN npm install dot express jade dustjs-linkedin dustjs-helpers ejs nunjucks vue@2.5.1 vue-server-renderer@2.5.1
# run npm install marko@4.13.6 require-from-string express@4.16.3
COPY src/ /home
WORKDIR /home
CMD ["node", "app.js"]