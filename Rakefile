task :default => :test
task :test do
  Dir.glob('./day-02/*_test.rb').each { |file| require file}
  Dir.glob('./day-02/test/*_test.rb').each { |file| require file}
end