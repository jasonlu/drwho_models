require 'active_record'
require 'yaml'
 
task :default => :migrate
 
desc "Migrate the database through scripts in db/migrate. Target specific version with VERSION=x"
task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end
 
task :environment do
  conn_params = YAML::load(File.open('config/database.yml'))
  env = ENV["rails_env"]
  ActiveRecord::Base.establish_connection(conn_params[env])
  ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))

end