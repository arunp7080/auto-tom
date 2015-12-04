 # Install MySQL server & MySQL client
  include_recipe "mysql"
  include_recipe "mysql::client"
  include_recipe "mysql::server"
    
