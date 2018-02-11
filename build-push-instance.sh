#!/bin/bash

# Check for sudo/root
printf "Checking for root permissions..."
if [[ $(id -u) -ne 0 ]]; then
	>&2 echo "Error: Root permissions required"
	exit 1
else
	echo "OK"
fi

if [ -z "$1" ]
  then
    echo "No arguments supplied. Expected 'worker' or 'manager'"
    exit 1
elif [[ "$1" == "worker" ]] || [[ "$1" == "manager" ]]; then
	echo "All ok!"
else 
	echo "passed wrong argument. Expected 'worker' or 'manager'"
	exit 1
fi

# worker or manager
instanceName=$1
directory=$1/
buildName=$1
repository=kron24rus/fibonacci:$1

echo $directory
echo $buildName
echo $repository

if [[ -d $directory ]]; then
	docker build -t $buildName $directory
	docker tag $buildName $repository
	docker push $repository
else
	>&2 echo "Error: directory not exists"
fi
