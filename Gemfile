source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.4.6'
ruby '2.4.10'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
#gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development



# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Used to poblate the db via SEED
gem 'faker', '~> 1.6', '>= 1.6.6'

# Pagination
gem 'will_paginate', '~> 3.1.0'

#
gem 'knock'
gem 'rack-cors'
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'simple_token_authentication', '~> 1.0' # see semver.org
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'omniauth-facebook'
gem 'httparty'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# File uploading
#gem 'carrierwave', '~> 1.0'
#gem 'mini_magick'
#gem 'fog'

group :development, :test do

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'annotate'
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.18'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# serializer
gem 'active_model_serializers', '~> 0.10.0'
