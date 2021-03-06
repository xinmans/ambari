#
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
#
class hdp-hadoop::params(
) inherits hdp::params 
{

  ##TODO: for testing in masterless mode
  $use_preconditions = false
  ####  
  $conf_dir = $hdp::params::hadoop_conf_dir 

  ####### users

  $mapred_user = $hdp::params::mapred_user
  $hdfs_user = $hdp::params::hdfs_user
  
  ##### security related
  $keytab_path = hdp_default("keytab_path","/etc/security/keytabs")
 
  if ($hdp::params::security_enabled == true) {
    $enable_security_authorization = true
    $security_type = "kerberos"
    $task_controller = "org.apache.hadoop.mapred.LinuxTaskController"
    $dfs_datanode_address = 1019
    $dfs_datanode_http_address = 1022
  } else {
    $enable_security_authorization = false
    $security_type = "simple"
    $task_controller = "org.apache.hadoop.mapred.DefaultTaskController"
    $dfs_datanode_address = hdp_default("dfs_datanode_address","50010")
    $dfs_datanode_http_address = hdp_default("dfs_datanode_http_address","50075")
  }

  ### hadoop-env
  
  $dtnode_heapsize = hdp_default("dtnode_heapsize","1024m")
  $ttnode_heapsize = hdp_default("ttnode_heapsize","1024m")

  $hadoop_heapsize = hdp_default("hadoop_heapsize","1024m")

  $hdfs_log_dir_prefix = hdp_default("hdfs_log_dir_prefix","/var/log/hadoop")

  $hadoop_pid_dir_prefix = hdp_default("hadoop_pid_dir_prefix","/var/run/hadoop")
  $run_dir = $hadoop_pid_dir_prefix

  $namenode_formatted_mark_dir = "${run_dir}/hdfs/namenode/formatted/"

  $jtnode_heapsize = hdp_default("jtnode_heapsize","1024m")

  $jtnode_opt_maxnewsize = hdp_default("jtnode_opt_maxnewsize","200m")

  $jtnode_opt_newsize = hdp_default("jtnode_opt_newsize","200m")

  $namenode_heapsize = hdp_default("namenode_heapsize","1024m")

  $namenode_opt_maxnewsize = hdp_default("namenode_opt_maxnewsize","640m")

  $namenode_opt_newsize = hdp_default("namenode_opt_newsize","640m")
  
  $hadoop_libexec_dir = hdp_default("hadoop_libexec_dir","/usr/lib/hadoop/libexec")
  
  $mapreduce_libs_path = hdp_default("mapreduce_libs_path","/usr/lib/hadoop-mapreduce/*")
  
  $mapred_log_dir_prefix = hdp_default("mapred_log_dir_prefix","/var/log/hadoop-mapreduce")

  $mapred_pid_dir_prefix = hdp_default("mapreduce_libs_path","/var/run/hadoop-mapreduce")

  ### compression related
  if (($hdp::params::lzo_enabled == true) and ($hdp::params::snappy_enabled == true)) {
    $mapred_compress_map_output = true
    $compression_codecs =  "org.apache.hadoop.io.compress.GzipCodec,org.apache.hadoop.io.compress.DefaultCodec,com.hadoop.compression.lzo.LzoCodec,com.hadoop.compression.lzo.LzopCodec,org.apache.hadoop.io.compress.SnappyCodec"
    $mapred_map_output_compression_codec = "org.apache.hadoop.io.compress.SnappyCodec"
  } elsif ($hdp::params::snappy_enabled == true) {
    $mapred_compress_map_output = true
    $compression_codecs = "org.apache.hadoop.io.compress.GzipCodec,org.apache.hadoop.io.compress.DefaultCodec,org.apache.hadoop.io.compress.SnappyCodec" 
    $mapred_map_output_compression_codec = "org.apache.hadoop.io.compress.SnappyCodec"
  } elsif ($hdp::params::lzo_enabled == true) {
    $mapred_compress_map_output = true
    $compression_codecs = "org.apache.hadoop.io.compress.GzipCodec,org.apache.hadoop.io.compress.DefaultCodec,com.hadoop.compression.lzo.LzoCodec,com.hadoop.compression.lzo.LzopCodec"
    $mapred_map_output_compression_codec = "com.hadoop.compression.lzo.LzoCodec"
  } else { 
    $mapred_compress_map_output = false
    $compression_codecs = "org.apache.hadoop.io.compress.GzipCodec,org.apache.hadoop.io.compress.DefaultCodec"
    $mapred_map_output_compression_codec = "org.apache.hadoop.io.compress.DefaultCodec"
  }

  ### core-site
  $fs_checkpoint_dir = hdp_default("core-site/fs.checkpoint.dir","/tmp/hadoop-hdfs/dfs/namesecondary")

  $proxyuser_group = hdp_default("core-site/proxyuser.group","users")

  ### hdfs-site
  $datanode_du_reserved = hdp_default("hdfs-site/datanode.du.reserved",1073741824)

  $dfs_block_local_path_access_user = hdp_default("hdfs-site/dfs.block.local.path.access.user","hbase")

  $dfs_data_dir = $hdp::params::dfs_data_dir

  $dfs_datanode_data_dir_perm = hdp_default("hdfs-site/dfs.datanode.data.dir.perm",750)

  $dfs_datanode_failed_volume_tolerated = hdp_default("hdfs-site/dfs.datanode.failed.volume.tolerated",0)

  $dfs_exclude = hdp_default("hdfs-site/dfs.exclude","dfs.exclude")

  $dfs_include = hdp_default("hdfs-site/dfs.include","dfs.include")
  
  $dfs_name_dir = hdp_default("hdfs-site/dfs.name.dir","/tmp/hadoop-hdfs/dfs/name")
  
  $dfs_replication = hdp_default("hdfs-site/dfs.replication",3)

  $dfs_support_append = hdp_default("hdfs-site/dfs.support.append",true)

  $dfs_webhdfs_enabled = hdp_default("hdfs-site/dfs.webhdfs.enabled",false)


 ######### mapred #######
   ### mapred-site

  $mapred_system_dir = '/mapred/system'

  $io_sort_mb = hdp_default("mapred-site/io.sort.mb","200")

  $io_sort_spill_percent = hdp_default("mapred-site/io.sort.spill.percent","0.9")

  $mapred_child_java_opts_sz = hdp_default("mapred-site/mapred.child.java.opts.sz","-Xmx768m")

  $mapred_cluster_map_mem_mb = hdp_default("mapred-site/mapred.cluster.map.mem.mb","-1")

  $mapred_cluster_max_map_mem_mb = hdp_default("mapred-site/mapred.cluster.max.map.mem.mb","-1")

  $mapred_cluster_max_red_mem_mb = hdp_default("mapred-site/mapred.cluster.max.red.mem.mb","-1")

  $mapred_cluster_red_mem_mb = hdp_default("mapred-site/mapred.cluster.red.mem.mb","-1")

  $mapred_hosts_exclude = hdp_default("mapred-site/mapred.hosts.exclude","mapred.exclude")

  $mapred_hosts_include = hdp_default("mapred-site/mapred.hosts.include","mapred.include")

  $mapred_job_map_mem_mb = hdp_default("mapred-site/mapred.job.map.mem.mb","-1")

  $mapred_job_red_mem_mb = hdp_default("mapred-site/mapred.job.red.mem.mb","-1")

  $mapred_jobstatus_dir = hdp_default("mapred-site/mapred.jobstatus.dir","file:////mapred/jobstatus")

  $mapred_local_dir = hdp_default("mapred-site/mapred.local.dir","/tmp/hadoop-mapred/mapred/local")
   
  $mapred_map_tasks_max = hdp_default("mapred-site/mapred.map.tasks.max",4)

  $mapred_red_tasks_max = hdp_default("mapred-site/mapred.red.tasks.max",4)

  $mapreduce_userlog_retainhours = hdp_default("mapred-site/mapreduce.userlog.retainhours",24)

  $maxtasks_per_job = hdp_default("mapred-site/maxtasks.per.job","-1")

  $scheduler_name = hdp_default("mapred-site/scheduler.name","org.apache.hadoop.mapred.CapacityTaskScheduler")

  #### health_check

  $security_enabled = $hdp::params::security_enabled

  $task_bin_exe = hdp_default("task_bin_exe")

  $rca_enabled = hdp_default("rca_enabled", false)
  if ($rca_enabled == true) {
    $rca_prefix = ""
  } else {
    $rca_prefix = "###"
  }
  # $ambari_db_server_host = hdp_default("ambari_db_server_host", "localhost")
  $ambari_db_rca_url = hdp_default("ambari_db_rca_url", "jdbc:postgresql://localhost/ambarirca")
  $ambari_db_rca_driver = hdp_default("ambari_db_rca_driver", "org.postgresql.Driver")
  $ambari_db_rca_username = hdp_default("ambari_db_rca_username", "mapred")
  $ambari_db_rca_password = hdp_default("ambari_db_rca_password", "mapred")

}
