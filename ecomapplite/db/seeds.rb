# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.create!([
	{
		name: "New Product1",
		id: 1,
		price: 150.3,
		description: "This is a new product",
		status: 1
	},
	{
		name: "New Product2",
		id: 2,
		price: 250.3,
		description: "This is a new product",
		status: 0
	}
	])	

Customer.create!([
	{
		id: 1,
		firstname: "Admin",
		lastname: "User",
		email: "admin@crossover.com",
		password_digest: "$2a$10$CI3pmpndAIwRAOwMQ7QTU.Lz9akvs/LaYkVvnSKF6uu6a9.P//cHi",
		admin: 1
	},
	{
		id: 2,
		firstname: "Himadri",
		lastname: "Das",
		email: "himadri@crossover.com",
		password_digest: "$2a$10$w0P8OTnruOC4mj18LJnWGOq805P00dQIUOKdYz1Odpwt6OFAq28lW",
		admin: 0
	},
	{
		id: 3,
		firstname: "John",
		lastname: "Doe",
		email: "johny@example.com",
		password_digest: "$2a$10$HT9JtExVpybqu.jDFclMsuny.ORso5hkJY/dq/nNh3TSOBadPa1Om",
		admin: 0
	}
	])	


Order.create!([
	{
		id: 1,
		order_no: "O0000001",
		total: 133.33,
		customer_id: "1",
		date: "31/12/2016"
	},
	{
		id: 2,
		order_no: "O0000002",
		customer_id: "2",
		total: 244.22,
		date: "25/10/2017"
	},
	{
		id: 3,
		order_no: "O0000003",
		customer_id: "2",
		total: 355.11,
		date: "31/03/2017"
	},
	{
		id: 4,
		order_no: "O0000004",
		customer_id: "2",
		total: 460.00,
		date: "10/12/2016"
	}
	])	


OrderLine.create!([
	{
		id: 1,
		order_id: 1,
		product_id: 1,
		qty: 3,
		unit_price: 150.3,
		total_price: 450.90
	},
	{
		id: 2,
		order_id: 3,
		product_id: 1,
		qty: 4,
		unit_price: 150.3,
		total_price: 600.12
	},
	{
		id: 3,
		order_id: 2,
		product_id: 2,
		qty: 2,
		unit_price: 150.3,
		total_price: 450.90
	},
	{
		id: 4,
		order_id: 4,
		product_id: 1,
		qty: 4,
		unit_price: 150.3,
		total_price: 1801.20
	}
	])	

