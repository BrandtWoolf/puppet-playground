$TTL    604800
@       IN      SOA     puppetdns.puppet-playground.com. admin.puppet-playground.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@             IN      NS    puppetdns.puppet-playground.com.
puppetdns     IN      A     192.168.4.9
puppetserver  IN      A     192.168.4.10
puppetdb      IN      A     192.168.4.11
postgres      IN      A     192.168.4.12