namespace :custom do

  desc "reset entire database and create default roles an admin account"
  task :reset_db => :environment do
    #purge the db
    Rake::Task["db:reset"].execute
    Rake::Task["db:migrate"].execute

    #create default roles
    Role.new(:name => 'Admin').save
    Role.new(:name => 'Doctor').save
    Role.new(:name => 'Technician').save
    Role.new(:name => 'Patient').save

    #create user 'admin' with default pw:1234abcd and assign 'admin' role to it

    admin = User.new(:email => 'admin@e.mail', :password => '1234abcd')
    admin.roles.append(Role.find_by_name('Admin'))
    admin.save
  end

end
