# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "a@a.com", password: "12345678")

Bar.create(name: "Florentine Cafe", description: "North End", user_id: 1)
Review.create(title: "Good", body: "food was awesome", rating: 4, bar_id: 1, user_id: 1)

Bar.create(name: "Beju", description: "Night Club", user_id: 1)
Review.create(title: "Great", body: "atmosphere was awesome", rating: 4, bar_id: 2, user_id: 1)

Bar.create(name: "Gypsy Bar", description: "Night Club", user_id: 1)
Review.create(title: "Crazy", body: "bubbles everywhere", rating: 3, bar_id: 3, user_id: 1)

Bar.create(name: "Tavern In The Square", description: "Tavern", user_id: 1)
Review.create(title: "Low Key", body: "friendly staff", rating: 3, bar_id: 4, user_id: 1)

Bar.create(name: "Joshua Tree", description: "Somerville", user_id: 1)
Review.create(title: "Hipster", body: "decent", rating: 4, bar_id: 5, user_id: 1)

Bar.create(name: "Venue", description: "Night Club", user_id: 1)
Review.create(title: "Nice", body: "atmosphere was awesome", rating: 4, bar_id: 6, user_id: 1)

Bar.create(name: "WonderBar", description: "Night Club", user_id: 1)
Review.create(title: "Great", body: "good drinks", rating: 4, bar_id: 7, user_id: 1)

Bar.create(name: "Cure", description: "Night Club", user_id: 1)
Review.create(title: "Great", body: "good drinks", rating: 4, bar_id: 8, user_id: 1)

Bar.create(name: "Royale", description: "Night Club", user_id: 1)
Review.create(title: "Great", body: "good drinks", rating: 4, bar_id: 9, user_id: 1)
