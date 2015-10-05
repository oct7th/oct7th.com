# rake tasks to build and deploy
desc 'Deploy to local production via rsync'

namespace :deploy do
  def deploy(env)
    puts "Building for #{env} ..."
    case env
    when :production, :local then
      Rake::Task['build:production'].invoke
    when :staging then
      Rake::Task['build:staging'].invoke
    end

    puts "Deploying to #{env} ..."
    case env
    when :production, :staging then
      system("MM_ENV=#{env} bundle exec middleman deploy")
    when :local then
      system('rsync -avhW --no-compress --progress build/ ../public_html/')
    end

    case env
    when :production, :local then
      puts "Rebuild for staging ..."
      Rake::Task['build:staging'].invoke
    end
  end

  desc 'Deploy site to production'
  task :production do
    deploy :production
  end

  desc 'Deploy site to staging'
  task :staging do
    deploy :staging
  end

  desc 'Deploy site to local production'
  task :local do
    deploy :local
  end
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

