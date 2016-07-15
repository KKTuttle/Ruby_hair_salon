require('sinatra')
require('sinatra-contrib')
require('rspec')
require('capybara')
require('pry')
require('pg')
require('rspec')
require('stylist')
require('client')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *;")
    DB.exec("DELETE FROM clients *;")
    # DB.exec("DELETE FROM patients *;")
  end
end
