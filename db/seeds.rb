require 'faker'
  
  # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!

 20.times do 
  item=Item.create!(
    user: admin,
    name: Faker::Lorem.sentence
)
   item.update_attributes!(created_at: rand(10.minutes .. 8.days).ago)
 end
 items=Item.all

 puts "Admin created"
 puts "#{Item.count} items created"