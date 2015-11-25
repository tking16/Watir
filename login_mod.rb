$LOAD_PATH<<'.'
require 'browser_mod'
require 'yaml'
include UseBrowser

module Log
browser = UseBrowser.browser_init

file = YAML.load_file('./credentials.yaml')

file['credentials'].each do |cre|
  user = browser.text_field id:'signup_email'
user.set "#{cre["user"]}"

  pass = browser.text_field id: 'signup_password'
pass.set "#{cre["password"]}"
end
end