# frozen_string_literal: true

source "https://rubygems.org"

gem "jekyll-theme-chirpy", "~> 6.0", ">= 6.0.1"
gem 'jekyll'
gem 'jekyll-paginate'
gem 'jekyll-tagging'
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "google-protobuf", "3.23.3",  :platforms => [:jruby]
# Lock jekyll-sass-converter to 2.x on Linux-musl
if RUBY_PLATFORM =~ /linux-musl/
  gem "jekyll-sass-converter", "~> 2.0"
end
