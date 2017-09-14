set :application, 'dacplay_www'
set :repo_url, 'git@github.com:AlexChien/bitsharesplayfoundation.org.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, "2017"

set :deploy_to, '/usr/local/www/dacplay_www'
set :scm, :git
set :user,        "runner"
set :runner,      "runner"

set :rvm_ruby_version, '2.2.5@dacplay_www'
set :rvm_type, :user


set :format, :pretty
# set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

set :passenger_restart_with_touch, true

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
