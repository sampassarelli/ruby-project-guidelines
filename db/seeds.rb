require 'pry'
Event.destroy_all
Ticket.destroy_all
User.destroy_all

user1 = User.create(username: "Sam", password: "pass", account_balance: 100)
user2 = User.create(username: "Rak", password: "rak", account_balance: 105)
user3 = User.create(username: "Islam", password: "mad", account_balance: 500)
user4 = User.create(username: "Derick", password: "cast", account_balance: 300)
user5 = User.create(username: "Max", password: "oppen", account_balance: 5000)

event1 = Event.create(event_name: "Superbowl", city: "Chicago", state: "Illinois", zip: 60605)
event2 = Event.create(event_name: "Rock Concert", city: "Chicago", state: "Illinois", zip: 60606)
event3 = Event.create(event_name: "Basketball Game", city: "Chicago", state: "Illinois", zip: 60602)
event4 = Event.create(event_name: "Pop Concert", city: "Chicago", state: "Illinois", zip: 60601)
event5 = Event.create(event_name: "Soccer Game", city: "Chicago", state: "Illinois", zip: 60605)

Ticket.create(user_id: user1.id, event_id: event1.id, price: 200, quantity: 3)
Ticket.create(user_id: user2.id, event_id: event2.id, price: 50, quantity: 1)
Ticket.create(user_id: user3.id, event_id: event3.id, price: 1000, quantity: 5)
Ticket.create(user_id: user4.id, event_id: event4.id, price: 100, quantity: 2)
Ticket.create(user_id: user5.id, event_id: event5.id, price: 60, quantity: 1)
Ticket.create(user_id: user1.id, event_id: event1.id, price: 200, quantity: 3)
Ticket.create(user_id: user1.id, event_id: event1.id, price: 200, quantity: 3)

