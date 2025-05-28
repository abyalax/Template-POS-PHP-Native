Example

```javascript
NIVEA MEN Extra Bright 50ml
qty = 2
unit_price 	= 25000
cost_price 	= 2500
discount 	= 0.08 ( 8% )
tax_rate 	= 0.10 ( 10% )

total_price 	= unit_price * qty
		= 25000 * 2
		= 50000

total_discount 	= unit_price * discount * qty
	  	= 25000 * 0.08 * 2
	  	= 4000

total_price 	= total_price - total_discount
		= 50000 - 4000
		= 46000	

total_tax 	= ( unit_price * tax_rate ) * qty
	  	= ( 25000 * 0.10 ) * 2
	  	= 5000

total_profit 	= ( unit_price - cost_price - total_discount ) * qty
		= ( 25000 - 15000 - 4000 ) * 2
		= 6000 * 2
		= 12000

last_price 	= total_price + total_tax 
		= 46000 + 5000
		= 51000