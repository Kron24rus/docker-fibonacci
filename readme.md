Images: https://hub.docker.com/r/kron24rus/fibonacci/tags/

Description:

build-push-instance.sh <manager or worker> - push changes to manager/worker image at docker.io

//Deploy and start:
start-vms.sh - Create and start VMs (vmanager, vworker1, vworker2, vdb)
init-swarm.sh - Initialize docker swarm at manager and join workers to it
deploy-stack.sh - Send `docker-compose.yml` to manager then deploy app

//Stop and undeploy:
remove-stack.sh - Undeploy app
leave-swarm.sh - All nodes leave swarm
stop-vms.sh - Stop VMs
