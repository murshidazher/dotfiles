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

### Ignore Zookeeper dependencies and install

```sh
brew unlink zookeeper
brew install zookeeper --ignore-dependencies
```

```sh
> brew services start zookeeper # starts as background service
> zkServer start # Or, if you don't want/need a background service you can just run
```
