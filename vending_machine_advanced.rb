class VendingMachineAdvanced
	puts "This Vending Machine contains 4 Items ['Pepsi','Fanta','Coke','Marinda'] to dispense"
	puts "Load vending machine with item Quantity:"
	
	$items = ["Pepsi","Fanta","Coke","Marinda"]
	$quantity = []
	$prices = [8,12,15,20]
	$coins = {1 => 0, 2 => 0, 5 => 0,10 => 0}

	$items.each do |item|
		puts "For #{item}:"
		$quantity.push(gets.chomp.to_i)
	end

	puts "Load coins into machine, You can load coins of 1,2,5 and 10 only"
	$coins.keys.each do |coin|
		puts "Load coins of #{coin} Rupee:"
		$coins[coin] = gets.chomp.to_i
	end

	puts "Final status of Vending Machine is as following:"
	puts "Items => #{$items}"
	puts "Prices => #{$prices}"
	puts "Quantity => #{$quantity}"
	puts "Available Coins inventory is:#{$coins}"

	puts "Enter item name to dispense:"
	$item = gets.chomp

	if(!($items.include?($item)))
		puts "Sorry, Item that you entered doesn't exist in Vending Machine."
		exit
	end

	puts "Enter item quantity:"
	quantity = gets.chomp.to_i

	def dispense_item(amount_to_pay,received)
		while (received < amount_to_pay) do
			puts "Please pay INR #{amount_to_pay} to grab this item"
			inserted_coin_value = gets.chomp.to_i
			if($coins.keys).include?(inserted_coin_value)
				received += inserted_coin_value
				amount_to_pay -= received
				$coins[inserted_coin_value] += 1
			else
				puts "Invalid Coin"
			end
		end

		puts "Thank you for buying #{$quantity[$items.index($item)]} #{$item}, See you again!"
		puts "Current status of Vending Machine is as following:"
		puts "Items => #{$items}"
		puts "Quantity => #{$quantity}"
		puts "Available Coins inventory is:#{$coins}"
	end

	if($quantity[$items.index($item)] >= quantity)
		$amount_to_pay = $prices[$items.index($item)] * quantity
		$amount_received = 0
		$quantity[$items.index($item)] -= quantity

		puts "We accept coins of 1,2,5 and 10 only"
		#puts "Plese pay coins for order of INR #{$prices[$items.index(item)]}"
		obj = VendingMachineAdvanced.new
		obj.dispense_item($amount_to_pay,$amount_received)
	else
		puts "Sorry, we just have #{$quantity[$items.index($item)]} #{$item} to dispense."
		exit		
	end
end