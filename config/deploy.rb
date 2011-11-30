require 'mongrel_cluster/recipes'
set :rake, "/var/lib/gems/1.8/bin/rake"
set :mongrel_rails, "/var/lib/gems/1.8/bin/mongrel_rails"
set :application, "pcp4erp"
set :repository,  "pcp4erp"
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/pcp4erp/rails_apps/#{application}"
set :mongrel_conf, "#{current_path}/config/mongrel_cluster.yml"
set :mongrel_rails, "/var/lib/gems/1.8/bin/mongrel_rails"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "192.168.1.216"
role :web, "192.168.1.216"
role :db,  "192.168.1.216", :primary => true
