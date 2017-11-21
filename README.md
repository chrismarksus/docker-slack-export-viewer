# docker-slack-export-viewer

If you have a free slack project that is passed the 10,000 message limit and you need access to previous messages. Or your project has ended and you need to backup the slack channels before deleting the channels. This project can help if you are unable to install python. Or you want to setup and automated process.

*I did not create the utility that does the work.** I only created a docker and the scripts that help setting up a automated use of the of the (slack-export-viewer)[https://github.com/hfaran/slack-export-viewer] See the (Acknowledgments)[#Acknowledgments] below.

## Getting Started

### Build the image myself
Download or clone the this git project.

```
mkdir docker-slack-export-viewer
cd docker-slack-export-viewer
git clone https://github.com/chrismarksus/docker-slack-export-viewer.git
 
docker build -t docker-slack-export-viewer .

docker run -d -e ZIPFILEPATH=current.zip -p 80:5000 docker-slack-export-viewer
```

Open a browser and goto [http://localhost]

### Check if the server is up

```
$ ./checkServer.sh http://localhost 
```

#### Successfully connect
```
$ ./checkServer.sh http://localhost
$ SERVER CHECK: host http://localhost success status code 200
```

#### Failed to connect
```
$ ./checkServer.sh http://localhost
$ SERVER CHECK: host http://localhost failed, status code 000
```

### Create a static version of the web site

```
$ ./copyServer.sh http://localhost 
COPY SERVER: The directory static exists, removing it now
COPY SERVER: Copy http://localhost to a static folder
...
wget output
...
COPY SERVER: Copy complete, rename folder
COPY SERVER: Directory localhost renamed to static/
```

Now there will be a static folder in the same direct with an index.html file. Open to view the web site.

### Prerequisites

You will need [Docker](https://www.docker.com/) installed
You need to be able to run bash scripts

## Built With

* [slack-export-viewer](https://github.com/hfaran/slack-export-viewer) - A Slack Export archive viewer that allows you to easily view and share your Slack team's export
* [Docker](https://www.docker.com/) - Container tool

## Authors

* **Chris Marks** - *Initial work* - [chrismarksus](https://github.com/chrismarksus/)

## Acknowledgments

* (slack-export-viewer by: Hamza Faran)[https://github.com/hfaran/slack-export-viewer]
