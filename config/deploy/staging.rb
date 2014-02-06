set :branch,      "staging"
set :rails_env, 'staging'
role :web, 'localhost:2222'
role :app, 'localhost:2222'
role :db,  'localhost:2222', :primary => true
