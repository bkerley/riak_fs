require "bundler/gem_tasks"
require 'rake/testtask'

task default: :test

Rake::TestTask.new do |t|
	t.ruby_opts = ['-Itest/support', '-Ilib']
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
end