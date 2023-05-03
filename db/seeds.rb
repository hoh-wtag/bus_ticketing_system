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
10.times do
  route = FactoryBot.create(:route)
  bus = FactoryBot.create(:bus)
  user = FactoryBot.create(:user)
  payment = FactoryBot.create(:payment)
  trip = FactoryBot.create(:trip, bus_id: bus.id, route_id: route.id)
  boarding_point = FactoryBot.create(:boarding_point)
  boarding = FactoryBot.create(:boarding, boarding_point_id: boarding_point.id, trip_id: trip.id)
  FactoryBot.create(:ticket, user_id: user.id, payment_id: payment.id, trip_id: trip.id, bus_id: bus.id, boarding_id: boarding.id)
end
