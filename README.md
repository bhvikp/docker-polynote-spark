# docker-polynote-spark
Dockerized Polynote notebook with spark and first class scala support.
*Thanks Netflix for open-sourcing it :)*

### Features!

    - Apache Spark 2.4.4
    - Polynote
    - AWS S3 libraries for Spark
    
**Note :** *You need to configure `config/spark-defaults.conf` file with your s3 credentials in order to read data from aws s3 into spark.*    

### Installation

Pull docker image from docker hub repository
```sh
$ docker pull bhavik9243/polynote-spark:latest
```

### Run/Start/Stop Container
First clone this repository to your local system and cd into it.
```sh
$ cd docker-polynote-spark
$ docker run -itd --name polynote -p 127.0.0.1:8192:8192 -p 127.0.0.1:4040-4050:4040-4050 -v config:/opt/spark/conf -v notebooks:/opt/notebooks bhavik9243/polynote-spark:latest
$ docker start polynote
$ docker stop polynote
```

### Polynote Access

> **Notebook** : [http://127.0.0.1:8192](http://127.0.0.1:8192)


#### Enjoy! :)
