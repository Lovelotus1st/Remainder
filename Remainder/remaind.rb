#File: remaind.rb
require "active_record"
#Adapter for the SQLite3
ActiveRecord::Base::establish_connection(:adapter => "sqlite3", :database => "remaind.sqlite")
#Define database schema, and create database "event"
class EventsTableScript < ActiveRecord::Migration
    def self.up
        create_table :events do |t|
            t.string :remaind_name
            t.string :due_date
            t.string :complete_yes_no
        end
    end
def self.down
    drop_table :events
  end
end
#Create the table that will be used in the database
EventsTableScript.up unless File::exists?("remaind.sqlite")
class Event < ActiveRecord::Base
end