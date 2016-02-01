viking_store
============

The Viking Store e-commerce application for Viking Commerce Inc

[Deepa Kackar](https://github.com/dkackar/assignment_viking_store.git)

[Thomas Lo](https://github.com/thomasjinlo/assignment_viking_store)

[vikingstore](http://www.vikingcodeschool.com/unit-8-databases-sql-and-activerecord/assignment-setting-up-the-db)

Entities:

Users,
Orders,
Products,
Categories,
Address,
Payments,
Carts

--------------------------------------------------------------------------
Attributes & types

Users => id:integer, name:string, email:string

Orders => id.integer, quantity:integer, price, product_id:integer, user_id:integer

Products => id.intger, stock:integer, price:integer, title:string, description:text, SKU:string, category_id:integer

