require 'faker'
  
  # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!

 emily = User.new(
   name:     'Emily',
   email:    'emily@example.com',
   password: 'helloworld',
 )
 emily.skip_confirmation!
 emily.save!

 users=User.all

 10.times do
   List.create!(
     user: users.sample,
     name:         Faker::Lorem.sentence,
     description:  Faker::Lorem.paragraph
   )
 end
 lists = List.all

 100.times do 
  item=Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence,
    list: lists.sample
)
   item.update_attributes!(created_at: rand(10.minutes .. 8.days).ago)
 end
 items=Item.all

 puts "Admin created"
 puts "#{List.count} lists created"
 puts "#{Item.count} items created"
