# rake tasks to build and deploy
desc 'Deploy locally via rsync'
task :deploy do
  Rake::Task['build:production'].invoke
  system('rsync -avhW --no-compress --progress build/ ../public_html/')
  Rake::Task['build:staging'].invoke
end

namespace :build do
  desc 'Build site with production configuration'
  task :production do
    system('MM_ENV=production bundle exec middleman build')
  end
  desc 'Build site with staging configuration'
  task :staging do
    system('MM_ENV=staging bundle exec middleman build')
  end
end

