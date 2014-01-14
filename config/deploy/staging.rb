set :branch,      "staging"
set :rails_env, 'staging'
role :web, 'localhost:2200'
role :app, 'localhost:2200'
role :db,  'localhost:2200', :primary => true
