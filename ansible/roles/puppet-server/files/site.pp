$puppetdb_host = 'puppetdb.puppet-playground.com'
$postgres_host = 'postgres.puppet-playground.com'

node 'puppetserver.puppet-playground.com' {
  # Here we configure the Puppet master to use PuppetDB,
  # telling it the hostname of the PuppetDB node
  class { 'puppetdb::master::config':
    puppetdb_server => $puppetdb_host,
  }
}
node 'postgres.puppet-playground.com' {
  # Here we install and configure PostgreSQL and the PuppetDB
  # database instance, and tell PostgreSQL that it should
  # listen for connections to the `$postgres_host`
  class { 'puppetdb::database::postgresql':
    listen_addresses => '*',
  }
}
node 'puppetdb.puppet-playground.com' {
  # Here we install and configure PuppetDB, and tell it where to
  # find the PostgreSQL database.
  class { 'puppetdb::server':
    listen_address => 192.168.4.11,
    database_host => $postgres_host,
  }
}