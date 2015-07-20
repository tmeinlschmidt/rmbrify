set :rails_env, :production

set :stage, :production
set :branch, 'production'

set :rvm_ruby_version, "2.1.5"

server 'orin.meinlschmidt.org',  user: 'jakub', roles: %w{db web app}
