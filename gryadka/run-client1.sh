#!/bin/bash

docker rm client1
docker run -i -t --name=client1 --hostname=client1 --network=gryadka_perseus -v $(pwd)/logs:/gryadka/logs gryadka_client