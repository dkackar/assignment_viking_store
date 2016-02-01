viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

[Deepa Kackar](https://github.com/dkackar/assignment_viking_store.git)

[Thomas Lo](https://github.com/thomasjinlo/assignment_viking_store)

[vikingstore](http://www.vikingcodeschool.com/unit-8-databases-sql-and-activerecord/assignment-setting-up-the-db)

Entities:

Users,
Orders,
Order_Items,
Products,
Categories,
Addresses,
Phones,
Payments,
Carts
Cart_Items

--------------------------------------------------------------------------
Attributes & types

Users => id:integer, name:string, email:string

Orders => id.integer, user_id:integer

Order_Items => id: integer, order_id: integer, product_id: integer, quantity:integer, price:float

Products => id:intger, stock:integer, price:integer, title:string, description:text, SKU:string, category_id:integer

Categories => id:intger, description:text

Addresses => id:id, user_id:integer, street_address1: text, street_address2:text, type:integer, city: text, state:text, country : text

Phones => id:integer, phone_no:integer, user_id:integer

Payments => id:integer, user_id: integer, credit_card:integer, credit_name:string, credit_expiry:date, 

Carts => id:integer, user_id:integer

Cart_Items => id: integer, card_id: integer, product_id: integer, quantity:integer



