# -*- encoding : utf-8 -*-

directories %w(app db config lib spec)

guard :bundler do
  watch('Gemfile')
end

guard 'rails' do
  watch('Gemfile.lock')
  watch(/^(config|lib)\/.*/)
end

guard :rspec, cmd: 'bundle exec rspec' do
  watch(/^spec\/.+_spec\.rb$/)
  watch(/^lib\/(.+)\.rb$/)     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }

  # Rails example
  watch(/^app\/(.+)\.rb$/)                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(/^app\/(.*)(\.erb|\.haml|\.slim)$/)          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"]
  end
  watch(%r{^spec/support/(.+)\.rb$})                  { 'spec' }
  watch('config/routes.rb')                           { 'spec/routing' }
  watch('app/controllers/application_controller.rb')  { 'spec/controllers' }
  watch('spec/rails_helper.rb')                       { 'spec' }
end

guard :rubocop do
  watch(/.+\.rb$/)
  watch(/(?:.+\/)?\.rubocop\.yml$/) { |m| File.dirname(m[0]) }
end

guard 'migrate' do
  watch(%r{^db/migrate/(\d+).+\.rb})
  watch('db/seeds.rb')
end