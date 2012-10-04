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
puts( "Continue? 'y' for YES 'q' for QUIT" )
x = gets.chomp()
while x != ('q' and 'N') do
    print "Enter the Name of the remainder"
    remaind_name = gets.chomp
    puts "When is the due date for #{remaind_name}"
    due_date = gets.chomp
    puts "So, did you or are you gonna complete on #{due_date} Yes/No ?"
    complete_yes_no = gets.chomp
    
Event.new(:remaind_name=>"#{remaind_name}", :due_date=>"#{due_date}", :complete_yes_no=>"#{complete_yes_no}").save
    
    puts "Do you want to enter another remainder Y/N ?"
    x = gets.chomp
end