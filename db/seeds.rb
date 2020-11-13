
Event.destroy_all
Ticket.destroy_all
User.destroy_all

user1 = User.create(username: "Sam", password: "1234")
user2 = User.create(username: "Rak", password: "4321")
user3 = User.create(username: "Islam", password: "1111")
user4 = User.create(username: "Derick", password: "2222")
user5 = User.create(username: "Max", password: "3333")



event1 = Event.create(event_name: "Superbowl XCII", category: "Sporting Event", city: "Chicago", location: "Outdoor", date: "11-15-2020")
event2 = Event.create(event_name: "Blink 182", category: "Music", city: "Chicago", location: "Outdoor", date: "11-15-2020")
event3 = Event.create(event_name: "Miami Heat vs Chicago Bulls", category: "Sporting Event", city: "Miami", location: "Indoor", date: "11-15-2020")
event4 = Event.create(event_name: "Drake", category: "Music", city: "Chicago", location: "Indoor", date: "11-15-2020")
event5 = Event.create(event_name: "Chicago Fire vs Portland Timbers", category: "Sporting Event", city: "Chicago", location: "Outdoor", date: "11-15-2020")
event6 = Event.create(event_name: "Bill Burr: LIVE", category: "Theater", city: "Los Angeles", location: "Indoor", date: "11-15-2020")
event7 = Event.create(event_name: "Phantom of the Opera", category: "Theater", city: "Chicago", location: "Indoor", date: "11-15-2020")
event8 = Event.create(event_name: "Los Angeles Lakers vs Chicago Bulls", category: "Sporting Event", city: "Los Angeles", location: "Indoor", date: "11-15-2020")
event9 = Event.create(event_name: "Dave Chapelle", category: "Theater", city: "Chicago", location: "Indoor", date: "11-15-2020")
event10 = Event.create(event_name: "Las Angeles Dodges vs Houston Cheaters", category: "Sporting Event", city: "Los Angeles", location: "Outdoor", date: "11-15-2020")
event11 = Event.create(event_name: "Detroit Pistons vs Another Trash Team", category: "Sporting Event", city: "Detroit", location: "Indoor", date: "11-15-2020")
event12 = Event.create(event_name: "Red Hot Chili Peppers", category: "Music", city: "Milwaukee", location: "Outdoor", date: "11-15-2020")
event13 = Event.create(event_name: "Milwaukee Bucks vs LA Clippers", category: "Sporting Event", city: "Milwaukee", location: "Indoor", date: "11-15-2020")
event14 = Event.create(event_name: "Hamilton", category: "Theater", city: "New York", location: "Indoor", date: "11-15-2020")
event15 = Event.create(event_name: "New York Knicks vs Brooklyn Nets", category: "Sporting Event", city: "New York", location: "Indoor", date: "11-21-2020")
event16 = Event.create(event_name: "Post Malone", category: "Music", city: "New York", location: "Outdoor", date: "11-21-2020")
event17 = Event.create(event_name: "Wicked", category: "Theatre", city: "Chicago", location: "Indoor", date: "11-21-2020")
event18 = Event.create(event_name: "Kanye West", category: "Music", city: "Chicago", location: "Outdoor", date: "11-21-2020")
event19 = Event.create(event_name: "Boston Bruins vs Pittsburgh Penguins", category: "Sporting Event", city: "Outdoor", location: "Indoor", date: "01-01-2021")
event20 = Event.create(event_name: "Beyonce", category: "Music", city: "Boston", location: "Outdoor", date: "11-21-2020")
event21 = Event.create(event_name: "The Nutcracker", category: "Theater", city: "Boston", location: "Indoor", date: "11-21-2020")
event22 = Event.create(event_name: "Houston Rockets vs Chicago Bulls", category: "Sporting Eevent", city: "Houston", location: "Indoor", date: "11-21-2020")
event22 = Event.create(event_name: "Luke Combs", category: "Music", city: "Houston", location: "Outdoor", date: "11-21-2020")
event23 = Event.create(event_name: "The Kardashians: LIVE! ", category: "Theater", city: "Houston", location: "Indoor", date: "11-21-2020")
event24 = Event.create(event_name: "Ariana Grande", category: "Music", city: "Milwaukee", location: "Outdoor", date: "11-21-2020")
event25 = Event.create(event_name: "San Diego Padres vs San Francisco Giants", category: "Sporting Event", city: "San Diego", location: "Outdoor", date: "11-21-2020")
event26 = Event.create(event_name: "Emotional Oranges", category: "Music", city: "San Diego", location: "Outdoor", date: "11-21-2020")
event27 = Event.create(event_name: "The Lion King: LIVE!", category: "Theater", city: "San Diego", location: "Outdoor", date: "11-21-2020")
event28 = Event.create(event_name: "Seattle Seahawks vs The Dallas Cowboys", category: "Sporting Event", city: "Outdoor", location: "Indoor", date: "11-21-2020")
event29 = Event.create(event_name: "Destiny's Child: The Reunion", category: "Music", city: "Seattle", location: "Outdoor", date: "11-21-2020")
event30 = Event.create(event_name: "Harry Potter and the Cursed Child", category: "Theater", city: "Seattle", location: "Indoor", date: "11-21-2020")

Ticket.create(user_id: user1.id, event_id: event1.id, quantity: 3)
Ticket.create(user_id: user2.id, event_id: event2.id, quantity: 1)
Ticket.create(user_id: user3.id, event_id: event3.id, quantity: 5)
Ticket.create(user_id: user4.id, event_id: event4.id, quantity: 2)
Ticket.create(user_id: user5.id, event_id: event5.id, quantity: 1)
Ticket.create(user_id: user1.id, event_id: event5.id, quantity: 3)
Ticket.create(user_id: user4.id, event_id: event1.id, quantity: 3)

