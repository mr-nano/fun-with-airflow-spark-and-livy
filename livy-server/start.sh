export SPARK_MASTER_HOST=`hostname`

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_MASTER_LOG

export SPARK_HOME=/spark

ln -sf /dev/stdout $SPARK_MASTER_LOG/spark-master.out

cd /spark/bin && /spark/sbin/../bin/spark-class org.apache.spark.deploy.master.Master \
    --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG/spark-master.out &

echo "Starting the livy server"

echo "livy.spark.master = spark://spark-master:7077" > /livy/apache-livy-0.6.0-incubating-bin/conf/livy.conf

/livy/apache-livy-0.6.0-incubating-bin/bin/livy-server start &

tail -f /dev/null
