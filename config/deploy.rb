set :application, 'million-dollar-microsite-maker'

# Source code repository details.
set :user,        'nick'
set :domain,      'milliondollarmicrositemaker.com'
set :port,        9323
set :scm,         :git
set :scm_verbose, false
#set :repository,  "ssh://#{user}@#{domain}:#{port}/home/nickh/src/xpr-internal/#{application}/.git/"
#set :repository,  "file:///home/nick/src/#{application}/.git/"
set :repository,  "git://github.com/nickhoffman/million-dollar-microsite-maker.git"
set :deploy_to,   "/var/www/#{domain}"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :use_sudo, false

default_run_options[:pty] = true 

namespace :config do
  desc 'Create the directory for temporary images.'
  task :create_temp_images_dir, :roles => :app, :except => {:no_release => true} do
    run "mkdir #{current_path}/public/temp_images/"
  end

  after 'deploy', 'config:create_temp_images_dir'
end

namespace :deploy do # {{{
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do
      puts "*** The '#{t}' task is a no-op with Passenger/mod_rails."
    end
  end
end # }}}

load 'config/deploy/reminder'       # Make sure this is the last line.
