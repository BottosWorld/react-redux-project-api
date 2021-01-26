# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Account.create([{
#     name: "Bryan's Chase Bank",
#     balance: 10000.00,
#     acc_type: "Checking Account"
#     },
#     {
#     name: "Chase Amazon Card",
#     balance: 1500.00,
#     acc_type: "Credit Card Account"
#     },
#     {
#     name: "Amy's Chase Bank",
#     balance: 25000.00,
#     acc_type: "Checking Account"
#     }
# ])

10.times do 
    Transaction.create({
        t_name: ["Target", "Best Buy", "Amazon", "Whole Foods", "Trader Joe's", "7 Eleven", "Shell"].sample,
        description: ["Gas", "Groceries", "Electronics", "Drinks", "Household Supplies"].sample,
        t_amount: rand(1.0..100).round(2),
        t_type:["credit", "debit", "withdrawal", "deposit"].sample,
        account_id: rand(1..3)
    })
end