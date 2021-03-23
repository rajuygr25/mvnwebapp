#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating www.Kart$i container.."
    sleep 1
    docker run --name www.Kart$i -d -it rajuygr/Kart-img /bin/bash
    echo "www.Kart$i container has been created!"
	echo "=============================="
done
docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -q` > IPs.txt


