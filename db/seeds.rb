# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

raise "db:seed may have already been run; if not, comment out this line or include environment variable and run again

e.g., 
DB_SEED=true ./bin/cucumber -r features features/pages.feature
" unless ENV['DB_SEED'] == 'true'

require File.expand_path('../browsercms.seeds.rb', __FILE__)
require File.expand_path('../my401k.seeds.rb', __FILE__)

load File.expand_path('../bcms_blog.seeds.rb', __FILE__)
