# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Route.destroy_all
Bus.destroy_all
User.destroy_all
Payment.destroy_all
Trip.destroy_all
BoardingPoint.destroy_all
Boarding.destroy_all
Ticket.destroy_all
Seat.destroy_all
route = Route.create(route_source: "Dhaka", route_destination: "Chattogram")
bus = Bus.create(bus_code: "Shohagh_001", bus_type: 0, bus_company: "Shohagh", bus_capacity: 48)
user = User.create( first_name: "Hasib", last_name: "Chowdhury", email: "hasib@gmail.com", user_name: "hasib", encrypted_password: "qwerzxcv", phone: "+8801758880059", role: 0)
payment = Payment.create
trip = Trip.create(ticket_price: 800, total_booked: 0, trip_date: "01-05-2023", trip_time: "13:00", bus: bus, route: route)
boarding_point = BoardingPoint.create(boarding_point_name: "Rajarbagh")
boarding = Boarding.create(boarding_time: "13:00", boarding_point: boarding_point, trip: trip)
ticket = Ticket.create(total_fare: 800, user: user, payment: payment, trip: trip, bus: bus, boarding: boarding)
seat = Seat.create(seat_code: "A1", seat_status: 0, bus: bus, ticket: ticket)
