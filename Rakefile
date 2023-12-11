task :default => :test
task :test do
  Dir.glob('./day-01/*_test.rb').each { |file| require file}
  Dir.glob('./*/test/*_test.rb').each { |file| require file}
end
