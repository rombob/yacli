#notification :gntp
notification :growl

guard :rspec, cmd: 'bundle exec rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/yacli/(.+)\.rb$}) { |m| "spec/#{m[1]}_spec.rb" }
  watch('lib/yacli.rb') { "spec" }
  watch('spec/spec_helper.rb') { "spec" }
end
