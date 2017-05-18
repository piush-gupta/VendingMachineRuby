class VendingMachineRevised
	puts "Enter an Item Number:"
	item = gets.chomp.to_i

	$prices = [10,75,40,75,90,40]

	if(!(item < $prices.length))
		puts "Sorry, Item number that you entered doesn't exist."
	end

	puts "Enter Amount:"
	paid = gets.chomp.to_i

	def dispense_item(item,paid)
		while (paid < $prices[item-1]) do
			puts "Please pay INR #{$prices[item-1]-paid} more to grab this item"
			paid += gets.chomp.to_i
		end

		puts "Thank you for buying item #{item}, your change is INR #{paid-$prices[item-1]}. Please come again!"
	end

	obj = VendingMachineRevised.new
	obj.dispense_item(item,paid)
end