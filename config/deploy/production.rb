 role :app, %w{localhost}
set :stage, :production
set :branch, 'master'
server 'localhost', user: 'webonise', roles: %w{app}

set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(password),
    password: 'user_deployers_password',
    user: 'deployer',
}
