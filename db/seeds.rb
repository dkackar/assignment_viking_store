puts "Starting seeds...\n\n"
start_time = Time.now

puts "Removing old data..."
# Blow away the existing data
User.delete_all
Product.delete_all
Order.delete_all
Category.delete_all
OrderItem.delete_all
Address.delete_all
puts "Old data removed.\n\n"



# increase your seed size by changing this
# NOTE: This can make it take MUCH longer!
# A value of 10 can take over 3 minutes
MULTIPLIER = 5


srand(42)

# start and end times
START_TIME = Time.find_zone("Pacific Time (US & Canada)").local(2011,1,1)
END_TIME = Time.find_zone("Pacific Time (US & Canada)").local(2014,1,1)

PAYMENT_METHODS = %w(VISA MasterCard AmEx Discover Check Cash StockOptions Doubloons)

def random_time
  rand(START_TIME..END_TIME)
end

def random_hours_later(time)
  time + rand(7).hours + rand(60).minutes
end

# CREATE STATES
STATES =
["Alabama", "Alaska", "Arizona", "Arkansas", "California",
"Colorado", "Connecticut", "Delaware", "Florida", "Georgia",
"Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
"Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
"Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri",
"Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
"New Mexico", "New York", "North Carolina", "North Dakota", "Ohio",
"Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina",
"South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
"Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]


CATEGORY =
["Book", "Toy", "Women's Clothing", "Shoes", "Plant",
"Car Equipment", "Computer", "Home Appliance", "Dog Food", "Cosmetic",
"Office Supplies", "Produce", "Medicine"]



puts "Creating Users..."
(MULTIPLIER * 20).times do
  name = Faker::Internet.user_name
  User.create( name: name,
               email: Faker::Internet.email(name) )
end


puts "Creating Categories..."
CATEGORY.each do |cat|
  Category.create( description: cat )
end


puts "Creating Product..."
(MULTIPLIER * 6).times do
  Product.create( price: Faker::Commerce.price.to_f,
                   stock: rand(100..1000),
                   title: Faker::Commerce.product_name,
                   description: Faker::Lorem.sentence,
                   sku: Faker::Code.isbn,
                   category_id: Category.all.sample.id,)
end


puts "Creating Address..."
User.all.each do |user|
  default_address = true
  rand(1..5).times do
    Address.create( user_id: user.id,
                        street: Faker::Address.street_name,
                        city: Faker::Address.city,
                        state: Faker::Address.state,
                        country: "USA",
                        zip: Faker::Address.zip.to_i,
                        default: default_address )
    default_address = false
  end
end

puts "Creating Orders..."
(MULTIPLIER * 20).times do
  user = User.all.sample
  address = Address.find_by(user_id: user.id)
  Order.create( user_id: user.id,
                   shipping_street: address.street,
                   shipping_city: address.city,
                   shipping_state: address.state,
                   shipping_zip: address.zip.to_i,
                   shipping_country: address.country,
                   billing_street: address.street,
                   billing_city: address.city,
                   billing_state: address.state,
                   billing_zip: address.zip.to_i,
                   billing_country: address.country,
                   phone_number: Faker::PhoneNumber.phone_number.gsub(".", "").to_i,
                   )
end

Order.all.each do |order|
  Payment.create(user_id: order.user_id,
                card_number: Faker::Business.credit_card_number,
                company_name: Faker::Business.credit_card_type,
                expiry_date: Faker::Business.credit_card_expiry_date,
                first_name: Faker::Name.first_name,
                first_name: Faker::Name.last_name)
end


Order.all.each do |order|
  4.times do |num|
    product = Product.all.sample
    OrderItem.create(order_id: order.id,
                product_id: product.id,
                price: product.price,
                quantity: rand(1..5))
  end       
end

puts "\n\nALL DONE!!!"
puts "It took #{Time.now - start_time} seconds."
