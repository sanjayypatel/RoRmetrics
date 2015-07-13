event_names = []
5.times do |n|
  event_names << Faker::Hacker.ingverb + n.to_s
end

member = User.new(
  name: "Member User",
  email: "member@example.com",
  password: "helloworld"
)
member.skip_confirmation!
member.save!




10.times do |n|
  app = RegisteredApplication.new(
    name: Faker::App.name + n.to_s,
    url: "http://" + Faker::Internet.domain_name,
    user: member
  )
  app.save!
end
apps = RegisteredApplication.all


50.times do
  event = Event.new(
    name: event_names.sample,
    registered_application: apps.sample
  )
  event.save!
end

puts "#{RegisteredApplication.count} applicaitons registered."
puts "#{Event.count} events created."
puts "#{User.count} users created."
puts "Finished seeding."