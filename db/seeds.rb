require 'faker'
  
  # Create an admin user
 admin = User.new(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
 )
 admin.skip_confirmation!
 admin.save!

 10.times do 
  item=Item.create!(
    user: admin,
    name: Faker::Lorem.sentence
)
   
 end
 items=Item.all

 puts "Admin created"
 puts "#{Item.count} items created"