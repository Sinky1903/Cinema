require('pry-byebug')
require('pg')
require_relative('models/customers')
require_relative('models/films')
require_relative('models/tickets')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new( { 'name' => "Ewan MacGregor", 'funds' => 1000} )
customer1.save()

customer2 = Customer.new( { 'name' => "Samuel L Jackson", 'funds' => 2000} )
customer2.save()

customer3 = Customer.new( { 'name' => "Jason Statham", 'funds' => 100} )
customer3.save()


film1 = Film.new( { 'title' => "Trainspotting 2", 'price' => 100} )
film1.save()

film2 = Film.new( { 'title' => "Snakes on a Plane", 'price' => 5} )
film2.save()

film3 = Film.new( { 'title' => "Crank 3", 'price' => 10} )
film3.save()


ticket1 = Ticket.new( { 'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

ticket2 = Ticket.new( { 'customer_id' => customer2.id, 'film_id' => film2.id})
ticket2.save()

ticket3 = Ticket.new( { 'customer_id' => customer3.id, 'film_id' => film3.id})
ticket3.save()

ticket4 = Ticket.new( { 'customer_id' => customer2.id, 'film_id' => film1.id})
ticket4.save()


binding.pry

nil