# docker-slack-export-viewer

Docker file for creating a view-able version of a slack exported zip file


#### Create the docker image
```
docker build -t cmarks/slack-export-viewer .
```

#### Startup the docker image
```
docker run -d -p 80:5000 cmarks/slack-export-viewer
```
