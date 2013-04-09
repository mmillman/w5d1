# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

m = User.create!(email: "mark@example.com", password: "mark")
r = User.create!(email: "roman@example.com", password: "roman")


p1 = Product.create!(name: "cup")
p2 = Product.create!(name: "hard drive")
p3 = Product.create!(name: "monitor")


mo1 = m.orders.create!
mo2 = m.orders.create!

ro1 = r.orders.create!


