Sys.setenv(HADOOP_CMD="/usr/local/hadoop/bin/hadoop")
Sys.setenv(HADOOP_HOME="/usr/local/hadoop")
Sys.setenv(HADOOP_STREAMING="/usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar")
Sys.setenv(JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre")
library(rmr2)
library(rhdfs)
hdfs.init()
m1 = matrix(1, nrow=500000, ncol=1)
m2 = matrix(1:500000, nrow=500000, ncol=1)
m3 = cbind(m1, m2);
print(m3)

# sapply(n, function(x) x^2)
n = to.dfs(m3)
n.map.fn = function(k, v){
  k = m3[,1]
  v = m3[,2]
  v = v^2
  # rmr.str(k)
  # rmr.str(v)
  keyval(k, v)
}
n.reduce.fn = function(k, v){
  vv = v + v
  keyval(k, vv)
}
result.output.mr = (mapreduce(input=n, map=n.map.fn, reduce=n.reduce.fn))
result = from.dfs(result.output.mr)
print(result)
