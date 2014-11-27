if [ -z ${BROKER_ID} ] ; then
  echo 'No BROKER_ID specified'
  exit -1
fi

if [ -z ${ZK_CONNECT} ] ; then
  echo 'No ZK_CONNECT specified.'
  exit -1
fi

KAFKA_CONFIG_DEFAULT=/server.properties

sed -i -e "s/^log\.dirs=.*/log.dirs=\/data/" $KAFKA_CONFIG_DEFAULT

echo "broker.id=${BROKER_ID}"$'\n' >> $KAFKA_CONFIG_DEFAULT
echo "zookeeper.connect=${ZK_CONNECT}"$'\n' >> $KAFKA_CONFIG_DEFAULT

/kafka/bin/kafka-server-start.sh $KAFKA_CONFIG_DEFAULT