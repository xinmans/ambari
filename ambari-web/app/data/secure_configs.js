/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
var App = require('app');
App.SecureConfigProperties = Ember.ArrayProxy.extend({
  content: require('data/secure_properties').configProperties
});
require('models/service_config');

var configProperties = App.SecureConfigProperties.create();

module.exports = [
  {
    serviceName: 'GENERAL',
    displayName: 'Kerberos',
    filename: 'hdfs-site',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'KERBEROS', displayName: 'General'})
    ],
    configs: configProperties.filterProperty('serviceName', 'GENERAL')
  },
  {
    serviceName: 'HDFS',
    displayName: 'HDFS',
    filename: 'hdfs-site',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'General', displayName: 'General'}),
      App.ServiceConfigCategory.create({ name: 'NameNode', displayName: 'NameNode'}),
      App.ServiceConfigCategory.create({ name: 'SNameNode',displayName: 'SNameNode'}),
      App.ServiceConfigCategory.create({ name: 'DataNode', displayName: 'DataNode'})
    ],
    sites: ['global', 'core-site', 'hdfs-site'],
    configs: configProperties.filterProperty('serviceName', 'HDFS')
  },

  {
    serviceName: 'MAPREDUCE',
    displayName: 'MapReduce',
    filename: 'mapred-site',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'JobTracker', displayName: 'JobTracker'}),
      App.ServiceConfigCategory.create({ name: 'TaskTracker', displayName: 'TaskTracker'})
    ],
    sites: ['mapred-site'],
    configs: configProperties.filterProperty('serviceName', 'MAPREDUCE')
  },

  {
    serviceName: 'HIVE',
    displayName: 'Hive/HCat',
    filename: 'hive-site',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'Hive Metastore', displayName: 'Hive Metastore'})
    ],
    sites: ['hive-site'],
    configs: configProperties.filterProperty('serviceName', 'HIVE')
  },

  {
    serviceName: 'WEBHCAT',
    displayName: 'WebHCat',
    filename: 'webhcat-site',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'WebHCat', displayName: 'WebHCat'})
    ],
    sites: ['webhcat-site'],
    configs: configProperties.filterProperty('serviceName', 'WEBHCAT')
  },

  {
    serviceName: 'HBASE',
    displayName: 'HBase',
    filename: 'hbase-site',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'HBase Master', displayName: 'HBase Master'}),
      App.ServiceConfigCategory.create({ name: 'RegionServer', displayName: 'RegionServer'})
    ],
    sites: ['hbase-site'],
    configs: configProperties.filterProperty('serviceName', 'HBASE')
  },
  {
    serviceName: 'ZOOKEEPER',
    displayName: 'ZooKeeper',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'ZooKeeper Server'})
    ],
    configs: configProperties.filterProperty('serviceName', 'ZOOKEEPER')

  },
  {
    serviceName: 'OOZIE',
    displayName: 'Oozie',
    filename: 'oozie-site',
    configCategories: [
      App.ServiceConfigCategory.create({ name: 'Oozie Server'})
    ],
    sites: ['oozie-site'],
    configs: configProperties.filterProperty('serviceName', 'OOZIE')
  }

];
