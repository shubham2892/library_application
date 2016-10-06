# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin1 = Member.create :name => "admin", :email => 'admin@mail.com', :password => "password", :is_admin => true, :is_preconfigured => true
user1 = Member.create :name => "user1", :email => 'user1@mail.com', :password => "user1password"
user2 = Member.create :name => "user2", :email => 'user2@mail.com', :password => "user2password"
user3 = Member.create :name => "user3", :email => 'user3@mail.com', :password => "user3password"
ayu = Member.create :name => "ayu", :email => 'ayu@ncsu.edu', :password => "123456", :is_admin => true, :is_preconfigured => true