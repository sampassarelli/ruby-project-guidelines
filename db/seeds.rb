
Event.destroy_all
Ticket.destroy_all
User.destroy_all

user1 = User.create(username: "Sam")
user2 = User.create(username: "Rak")
user3 = User.create(username: "Islam")
user4 = User.create(username: "Derick")
user5 = User.create(username: "Max")

event1 = Event.create(event_name: "Superbowl XCII", category: "Sporting Event", city: "Chicago", zip: 60605)
event2 = Event.create(event_name: "Blink 182", category: "Music", city: "Chicago", zip: 60606)
event3 = Event.create(event_name: "Chicago Bulls vs Miami Heat", category: "Sporting Event", city: "Miami", zip: 60602)
event4 = Event.create(event_name: "Drake", category: "Music", city: "Chicago", zip: 60601)
event5 = Event.create(event_name: "Chicago Fire vs Portland Timbers", category: "Sporting Event", city: "Chicago", zip: 60605)
event6 = Event.create(event_name: "Bill Burr: LIVE", category: "Theater", city: "Minneapolis", zip: 60605)
event7 = Event.create(event_name: "Phantom of the Opera", category: "Theater", city: "Chicago", zip: 60605)
event8 = Event.create(event_name: "Chicago Bulls vs LA Lakers", category: "Sporting Event", city: "Chicago", zip: 60605)
event9 = Event.create(event_name: "Dave Chapelle", category: "Theater", city: "Chicago", zip: 60605)
event10 = Event.create(event_name: "Justin Bieber", category: "Music", city: "Chicago", zip: 60605)

Ticket.create(user_id: user1.id, event_id: event1.id, price: 200, quantity: 3)
Ticket.create(user_id: user2.id, event_id: event2.id, price: 50, quantity: 1)
Ticket.create(user_id: user3.id, event_id: event3.id, price: 1000, quantity: 5)
Ticket.create(user_id: user4.id, event_id: event4.id, price: 100, quantity: 2)
Ticket.create(user_id: user5.id, event_id: event5.id, price: 60, quantity: 1)
Ticket.create(user_id: user1.id, event_id: event5.id, price: 200, quantity: 3)
Ticket.create(user_id: user4.id, event_id: event1.id, price: 200, quantity: 3)

