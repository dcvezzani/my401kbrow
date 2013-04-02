def run_spec(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  #system "bundle exec rspec #{file}"
  system "./bin/cucumber -r features --drb features/pages.feature"
  puts
end

#watch("spec/.*/*_spec.rb") do |match|

watch("features/pages.feature") do |match|
  run_spec match[0]
end

#watch("app/(.*/.*).rb") do |match|
#  run_spec  %{spec/#{match[1]}_spec.rb}
#end

