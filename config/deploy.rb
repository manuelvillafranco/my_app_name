# config valid for current version and patch releases of Capistrano
lock "~> 3.19.1"

set :application, "proyecto_web"
set :repo_url, "git@github.com:manuelvillafranco/my_app_name.git"
set :deploy_to, '/home/deploy/proyecto_web'

set :rvm_type, :system
set :rvm_custom_path, '/usr/local/rvm'

#set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_files, %w{config/database.yml config/master.key}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/system}

set :keep_releases, 5

set :puma_threads, [4, 16]
set :puma_workers, 0

set :password, ask('Server password', nil, echo: false)

set :nginx_server_name, 'vmi2004021.contaboserver.net'
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"

# Configurar SSH para usar autenticación por contraseña
set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(password),
  password: fetch(:password)
}

after 'deploy:publishing', 'deploy:restart'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
