def run_test(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  #system "./bin/ rspec #{file}"
  #system "./bin/rake test TEST=#{file}"
  system "testdrb -Itest #{file}"
  puts
end

def run_feature(file)
  unless File.exist?(file)
    puts "#{file} does not exist"
    return
  end

  puts "Running #{file}"
  system "./bin/cucumber -r features --drb features/pages.feature"
  puts
end

watch("test/.*/*_test.rb") do |match|
  require 'debugger'
  run_test File.expand_path(match[0])
end

watch("app/(.*/.*).rb") do |match|
 run_test  %{test/#{match[1]}_test.rb}
end


watch("features/pages.feature") do |match|
  run_feature match[0]
end

