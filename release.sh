set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=akhilra
# image name
IMAGE=helloworld
# ensure we're up to date
git pull origin master
# bump version
docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"
# run build
./build.sh
# tag it
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push --set-upstream origin master
git push --tags
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
