unless Rails.env.production?
  namespace :db do
    namespace :development do
      desc 'Create test data'
      task :populate => :environment do
        User.destroy_all

        User.create email: 'admin@campblodgett.org', password: 'password', password_confirmation: 'password'
      end
    end
  end
end
