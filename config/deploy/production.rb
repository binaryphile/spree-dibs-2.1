set :branch,      "master"
set :rails_env, 'production'
role :web, '192.168.0.124'
role :app, '192.168.0.124'
role :db,  '192.168.0.124', :primary => true
