require 'bundler/capistrano'
require 'sidekiq/capistrano'

server 'projectmuses.com', :web, :app, :db, primary: true

set :application, "muses"
set :user, "dev"
set :deploy_to, "/home/#{user}/rails_projects/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :keys, "/home/#{user}/rails_projects/keys/#{application}"

set :scm, "git"
set :repository,  "git@github.com:jbcden/#{application}.git"
set :branch, "production"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  task :start do; end
  task :stop do; end
  task :restart, roles: :app, except: {no_release: true} do
    run "touch #{deploy_to}/current/tmp/restart.txt"
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/apache.conf /etc/apache2/sites-available/#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.production.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{keys}/local_env.yml #{release_path}/config/local_env.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote"
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/production`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end


# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
