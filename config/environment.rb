# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Moederse::Application.initialize!

APP_VERSION = `git describe --tags`.gsub(/\s+/, "")