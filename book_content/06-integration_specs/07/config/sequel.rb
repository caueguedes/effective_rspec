require 'sequel'
DB = Sequel.sqlite("./db/#{ENV.fetch('RACK_NV', 'development')}.rb")