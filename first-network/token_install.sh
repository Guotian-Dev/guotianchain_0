#!/bin/bash

echo "========= install token chaincode start =========== "

docker exec -it cli bash

peer chaincode query -C guotianchannel -n mycc -c '{"Args":["query","a"]}'

echo "========= install token chaincode completed =========== "


exit 0