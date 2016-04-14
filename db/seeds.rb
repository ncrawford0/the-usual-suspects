# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.create(email: "a@a.com", password: "12345678")

bar1 = Bar.create(name: "Florentine Cafe", description: "North End", user: user1)
Review.create(title: "Good", body: "food was awesome", rating: 4, bar: bar1, user: user1)

bar2 = Bar.create(name: "Beju", description: "Night Club", user: user1)
Review.create(title: "Great", body: "atmosphere was awesome", rating: 4, bar: bar2, user: user1)

bar3 = Bar.create(name: "Gypsy Bar", description: "Night Club", user: user1)
Review.create(title: "Crazy", body: "bubbles everywhere", rating: 3, bar: bar3, user: user1)

bar4 = Bar.create(name: "Tavern In The Square", description: "Tavern", user: user1)
Review.create(title: "Low Key", body: "friendly staff", rating: 3, bar: bar4, user: user1)

bar5 = Bar.create(name: "Joshua Tree", description: "Somerville", user: user1)
Review.create(title: "Hipster", body: "decent", rating: 4, bar: bar5, user: user1)

bar6 = Bar.create(name: "Venue", description: "Night Club", user: user1)
Review.create(title: "Nice", body: "atmosphere was awesome", rating: 4, bar: bar6, user: user1)

bar7 = Bar.create(name: "WonderBar", description: "Night Club", user: user1)
Review.create(title: "Great", body: "good drinks", rating: 4, bar: bar7, user: user1)

bar8 = Bar.create(name: "Cure", description: "Night Club", user: user1)
Review.create(title: "Great", body: "good drinks", rating: 4, bar: bar8, user: user1)

bar9 = Bar.create(name: "Royale", description: "Night Club", user: user1)
Review.create(title: "Great", body: "good drinks", rating: 4, bar: bar9, user: user1)
