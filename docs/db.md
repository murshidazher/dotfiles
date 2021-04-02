## db

### kafka and zookeeper

> Refer to this article here on [kafka and zookeeper](https://medium.com/@at_ishikawa/getting-started-with-kafka-on-mac-f6aa8924fcda)

```sh
$ brew install kafka
$ brew install zookeeper
$ zkServer start
$ kafka-server-start /usr/local/etc/kafka/server.properties
$ zkServer stop
```

### Ignore Zookeeper brew dependencies

```sh
# check all the dependencies except java
$ brew list <package_name> || brew install <package_name>
$ brew unlink zookeeper
$ brew install zookeeper --ignore-dependencies # to ignore openjdk 15 dependency
```

```sh
$ brew services start zookeeper # starts as background service
$ zkServer start # Or, if you don't want/need a background service you can just run
```

### etcd

- key/value pair database

```sh
$ brew install etcd
$ etcd  # execute etcd to start the service
```
