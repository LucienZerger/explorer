FROM node:6.12

#COPY ./strayacoin.conf /root/.strayacoin/strayacoin.conf
#WORKDIR /usr/src/strayacoin
#COPY . /usr/src/strayacoin
#RUN ./build-dep.sh && ./build-unix.sh

WORKDIR /app

# update and install tools
RUN apt-get update && apt-get install -y git nano mongodb mongodb-clients

# install nodejs v8
#RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && apt-get install -y nodejs

# grab explorer from repo
RUN git clone https://github.com/LucienZerger/explorer

WORKDIR /app/explorer

# install explorer packages
RUN npm install --production
RUN cp settings.json.template settings.json

# start mongo daemon
RUN service mongodb start
#RUN service mongodb enable








EXPOSE 3001

#CMD ["strayacoind", "--printtoconsole"]
