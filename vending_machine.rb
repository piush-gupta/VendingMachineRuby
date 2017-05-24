class VendingMachine
	$item1 = 25
	$item2 = 75
	$item3 = 90
	$item4 = 75
	$item5 = 50
	$item6 = 75

	puts "This Vending Machine contains 6 Items to dispense"
	puts "Which Item number you want to dispense:"
	item = gets.chomp.to_i

	puts "Enter amount for this Item:"
	paid = gets.chomp.to_i

	def dispense_item(item,paid)
			puts "item="+item.to_s
			puts "paid="+paid.to_s

		if (item == 2 || item == 4 || item == 6)
			if (paid >= $item2)
				output =  "Thank you for buying item #{item}, your change is INR #{paid-$item2}. Please come again!"
			elsif (paid < $item2)
				output = "Please insert another INR #{$item2-paid}"
			end
		elsif (item == 1)
			if (paid >= $item1)
				output = "Thank you for buying item #{item}, your change is INR #{paid-$item1}. Please come again!"
			elsif (paid < $item1)
				output = "Please insert another INR #{$item1-paid}"
			end
		elsif (item == 3)
			if (paid >= $item3)
				output = "Thank you for buying item #{item}, your change is INR #{paid-$item3}. Please come again!"
			elsif (paid < $item3)
				output = "Please insert another INR #{$item3-paid}"
			end
		elsif (item == 5)
			if (paid >= $item5)
				output = "Thank you for buying item #{item}, your change is INR #{paid-$item5}. Please come again!"
			elsif (paid < $item5)
				output = "Please insert another INR #{$item5-paid}"
			end
		else
			output = "Sorry, Item number that you entered doesn't exist."
		end
		output
	end

	obj = VendingMachine.new()
	puts obj.dispense_item(item,paid)
end		