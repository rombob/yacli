require "bundler/gem_tasks"
require 'rubocop/rake_task'

task :default => [:spec]
desc 'run Rspec specs'
task :spec do
  sh 'rspec spec'
end

desc 'Run Rspec spec with reports'
task :spec_report do
  sh 'rspec spec --format RspecJunitFormatter --out spec/reports/rspec.xml'
end

desc 'Run RuboCop on the lib directory'
RuboCop::RakeTask.new(:rubocop) do |task|
  task.formatters = [%w(files offenses)]
  task.fail_on_error = false
end