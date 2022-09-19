### Put a file with go archive into image-files and change Dockerfile
RUN tar -C /usr/local -xzvf {go tar.gz name}

### Build container
docker image build -t decimal-proto-gen .

### Start container within proto folder
Windows:
docker run --rm -it -v ${PWD}:/proto-gen/proto decimal-proto-gen
Linux:
docker run --rm -it -v ${pwd}:/proto-gen/proto decimal-proto-gen

### Run generation script
scripts/protocgen.sh

