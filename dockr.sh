sudo docker container rm explorer
sudo docker run -it -p 127.0.0.1:3001:3001 --name explorer explorer /bin/bash
