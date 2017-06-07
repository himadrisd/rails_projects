def product_attributes (overrides = {})
	{
		name: "New Product",
		id: 1,
		price: 150.3,
		description: "This is a new product",
		status: 1
	}.merge(overrides)
end