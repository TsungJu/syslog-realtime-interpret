#!/bin/bash

curl -X POST -H "Content-Type:application/json" localhost:8083/connectors --data '{"name":"mongodb-sink-connector","config":{"connector.class":"com.mongodb.kafka.connect.MongoSinkConnector","tasks.max":"1","topics":"messages_log_interpreted","connection.uri":"mongodb://localhost:27017","database":"syslog","collection":"messages_log_kafka_streams","max.num.retries":"1","retries.defer.timeout":"5000","transforms":"MakeMap","transforms.MakeMap.type":"org.apache.kafka.connect.transforms.HoistField$Value","transforms.MakeMap.field":"log","value.converter.schemas.enable":"false","value.converter":"org.apache.kafka.connect.json.JsonConverter"}}'
