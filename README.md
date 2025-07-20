# Steps to create the
## Build docker
```
cd devcontainer
docker compose build
```

## Run the docker for the first time:
```
docker compose up -d ros_melodic_tmp3
```

During the first time, run
the following command in the docker to populate the folder:
```
./populate_folder.sh
```

## source workspace
```
source dorfl_ws/devel/setup.bash
```
