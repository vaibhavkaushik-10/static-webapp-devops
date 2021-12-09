FROM node
WORKDIR /data
COPY ./node-app/ ./
RUN npm install
EXPOSE 8080
#CMD ["node" "node-app/provided/static/js/pixgrid.js"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
