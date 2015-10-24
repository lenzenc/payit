namespace :payit do

  namespace :db do

    task :reset do
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:schema:dump'].invoke
      Rake::Task['db:seed_fu'].invoke
    end

  end

end
