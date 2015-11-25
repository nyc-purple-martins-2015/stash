pricetags = ['$', '$$', '$$$', '$$$$']

pricetags.map! { |tag| Pricetag.create(price: tag) }
