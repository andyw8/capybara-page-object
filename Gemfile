source :rubygems

HOST_OS = RbConfig::CONFIG['host_os']


# ------------------------------------------------------------------------------
# Dependencies to develop the gem.
# Everything needed to run rake, tests, features, etc.
group :development do

  # must be before guard
  case HOST_OS
    when /darwin/i
      gem 'growl'
      gem 'rb-fsevent'
    when /linux/i
      gem 'libnotify',    '~> 0.8.0'
      gem 'rb-inotify',   '~> 0.9.0'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'rb-notifu'
      gem 'win32console'
    else
      raise "Platform '#{HOST_OS}' is not supported"
  end

  gem 'bundler',        '~> 1.1.0'
  gem 'guard',          '~> 1.6.0'
  gem 'guard-rspec',    '~> 2.4.0'
  gem 'guard-spork',    '~> 1.5.0'
  gem 'jeweler',        '~> 1.8.3'
  gem 'rake',           '~> 10.0.0'
  gem 'rdoc',           '~> 3.12.0'
  gem 'rspec',          '~> 2.13.0'
  gem 'simplecov',      '~> 0.7.0', :require => false
  gem 'spork',          ' > 1.0.0.rc'
end


# ------------------------------------------------------------------------------
# Dependencies required to use the gem.
gem 'activesupport',    '> 2.1.0' # for OrderedHash
gem 'capybara'
