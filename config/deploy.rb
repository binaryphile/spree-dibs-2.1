require "bundler/capistrano"
load 'deploy/assets'

set :stages, %w(production staging)
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

set :application, "spree"
set :user, 'spree'
set :group, 'www-data'

set :scm, :git
set :repository,  "git://github.com/binaryphile/spree-dibs-2.1"
set :deploy_to,   "/data/#{application}"
set :deploy_via,  :remote_cache
set :use_sudo,    false

default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

namespace :foreman do
  desc "Export the Procfile to Bluepill's .pill script"
  task :export, :roles => :app do
    run "cd #{current_path} && bundle exec foreman export bluepill /data/#{application}/shared/config"
    sudo "bluepill load /data/#{application}/shared/config/#{application}.pill"
  end

  desc "Start the application services"
  task :start, :roles => :app do
    sudo "bluepill #{application} start"
  end

  desc "Stop the application services"
  task :stop, :roles => :app do
    sudo "bluepill #{application} stop"
  end

  desc "Restart the application services"
  task :restart, :roles => :app do
    sudo "bluepill #{application} restart"
  end
end

namespace :deploy do
  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
    run "ln -nfs #{shared_path}/config/devise.rb #{release_path}/config/initializers/devise.rb"
    run "ln -nfs #{shared_path}/config/Procfile #{release_path}/Procfile"
    run "ln -nfs #{shared_path}/config/.foreman #{release_path}/.foreman"
    run "ln -nfs #{shared_path}/spree #{release_path}/public/spree"
  end
end

before 'deploy:assets:precompile', 'deploy:symlink_shared'

before 'deploy:start', 'foreman:export'
after 'deploy:start', 'foreman:start'

before 'deploy:restart', 'foreman:export'
after 'deploy:restart', 'foreman:restart'

task :uname do
  run "uname -a"
end

