Admin.create(email: "admin@gmail.com", password: "theusualsuspects")
User.create(email: "user@gmail.com", password: "12345678")
user1 = User.create(email: "hui.1tommy@gmail.com", password: "icantspell")
Bar.create(name: "Storyville", description: "Storyville pioneers a new trend in the city\'s nightlife as an exciting one-of-a-kind environment where Speakeasy meets nightclub.", street: "90 Exeter Street", city: "Boston", state: "MA", zip: "12116", phone: "6172361134", user: user1, website: "www.storyvilleboston.com")
Bar.create(name: "Bijou", description: "Sleek late-night club in circa-1882 former theater drawing lines for sets by international DJs.", street: "51 Stuart Street", city: "Boston", state: "MA", zip: "12116", phone: "6173574565", user: user1, website: "www.bijouboston.com")
Bar.create(name: "Top of the Hub", description: "Upscale American fare, live jazz & renowned 360-degree views from the top of the Prudential Center.", street: "800 Boylston Street", city: "Boston", state: "MA", zip: "12116", phone: "6175361775", user: user1, website: "www.topofthehub.net")
Bar.create(name: "Royale", description: "Spacious multilevel megaclub draws trendy crowds for DJs, dancing & live-music shows.", street: "279 Tremont Street", city: "Boston", state: "MA", zip: "12116", phone: "6173387699", user: user1, website: "www.royaleboston.com")
Bar.create(name: "Tavern in the Square", description: "American fare, draft beers, patio seats & TV sports are on tap at this casual local chain.", street: "161 Brighton Ave", city: "Boston", state: "MA", zip: "12134", phone: "6177828100", user: user1, website: "www.taverninthesquare.com")
Bar.create(name: "Sullivan\'s Tap", description: "Dive bar to grab a few beers.", street: "168 Canal Street", city: "Boston", state: "MA", zip: "12114", phone: "6174563423", user: user1, website: "")
Bar.create(name: "Ned Devine\'s", description: "Busy, casual Irish pub with cozy dining room transforms into a high-energy nightclub on weekends.", street: "1 Faneuil Hall Marketplace", city: "Boston", state: "MA", zip: "12109", phone: "6172488800", user: user1, website: "www.neddevinesboston.com")