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

To connect to the host, run
```
ssh ros@localhost -p 822
```

You may also connect do remote edit through vscode by connecting to this host. 
You may not use devcontainer in vscode, as vscode-server uses the patched glibc version
only through ssh, not through devcontainer.

### First-time setup
During the first time, run
the following command in the docker to populate the folder:
```
./populate_folder.sh
```

### source workspace
```
source dorfl_ws/devel/setup.bash
```

### for window to pop up
For window to pop up in the host machine, run
```
xhost +
```
on the host machine.
