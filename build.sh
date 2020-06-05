set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=akhilra
# image name
IMAGE=helloworld
docker build -t $USERNAME/$IMAGE:latest .
