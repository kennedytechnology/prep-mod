# Console command is "rake db:reset"
desc "Completely reset the database, then seed it."
	task :reset_db do
		Rake::Task["db:drop"].invoke
		Rake::Task["db:create"].invoke
		Rake::Task["db:schema:load"].invoke
		Rake::Task["db:seed"].invoke
	end
