set :branch,      "master"
role :web, '192.168.0.118'
role :app, '192.168.0.118'
role :db,  '192.168.0.118', :primary => true
