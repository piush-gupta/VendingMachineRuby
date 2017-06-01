class VendingMachineAdvanced
	puts "This Vending Machine contains 4 Items ['Pepsi','Fanta','Coke','Marinda'] to dispense"
	puts "Load vending machine with item Quantity:"
	
	$items = ["Pepsi","Fanta","Coke","Marinda"]
	$quantity = []
	$prices = [8,12,15,20]
	$coins = {1 => 0, 2 => 0, 5 => 0,10 => 0}
	$tmp_coins = {1 => 0, 2 => 0, 5 => 0,10 => 0}
	$refund_coins = {1 => 0, 2 => 0, 5 => 0,10 => 0}

	$items.each do |item|
		puts "For #{item}:"
		$quantity.push(gets.chomp.to_i)
	end

	puts "Load coins into machine, You can load coins of 1,2,5 and 10 only"
	$coins.keys.each do |coin|
		puts "Load coins of #{coin} Rupee:"
		val = gets.chomp.to_i
		$coins[coin] = val
		$tmp_coins[coin] = val
	end

	puts "Final status of Vending Machine is as following:"
	puts "Items => #{$items}"
	puts "Prices => #{$prices}"
	puts "Quantity => #{$quantity}"
	puts "Available Coins inventory => #{$coins}"

	puts "Enter item name to dispense:"
	$item = gets.chomp.capitalize

	if(!($items.include?($item)))
		puts "Sorry, Item that you entered doesn't exist in Vending Machine."
		exit
	end

	puts "Enter item quantity:"
	quantity_to_dispense = gets.chomp.to_i

	def dispense_item(amount_to_pay,received, quantity_to_dispense)
		invalid_coin_attempt = 0
		amount_to_grab = amount_to_pay
		while (received < amount_to_pay) do
			if(invalid_coin_attempt < 3)
				puts "Please pay INR #{amount_to_grab} to grab this item"
				inserted_coin_value = gets.chomp.to_i
				if($coins.keys).include?(inserted_coin_value)
					#will initial invalid_coin_attempt here
					if(amount_to_grab < inserted_coin_value)
						amount = is_ready_to_refund(inserted_coin_value-amount_to_grab)
						if(amount > 0)
							puts "issuficient change, insert another coin"
						else
							$coins[inserted_coin_value] += 1
							$tmp_coins[inserted_coin_value] += 1
							calculate_refund(inserted_coin_value-amount_to_grab)
							received += inserted_coin_value
							amount_to_grab -= inserted_coin_value
						end
					else
						$coins[inserted_coin_value] += 1
						$tmp_coins[inserted_coin_value] += 1
						received += inserted_coin_value
						amount_to_grab -= inserted_coin_value
					end
				else
					puts "Invalid Coin, Please enter valid coin"
					invalid_coin_attempt += 1
				end
			else
				puts "Sorry you have exhausted all 3 attempts of inserting valid coins"
				exit
			end	
		end

		puts "Thank you for buying #{quantity_to_dispense} #{$item},Your order is complete. See you again!"
		puts "Current status of Vending Machine is as following:"
		puts "Items => #{$items}"
		puts "Quantity => #{$quantity}"
		puts "Available Coins inventory => #{$coins}"
	end

	def is_ready_to_refund(amount)
		9.times do
			if(((amount / 10) >= 1) && $tmp_coins[10] > 0)
				amount -= 10
			 $tmp_coins[10] -= 1
			elsif (((amount / 5) >= 1) && $tmp_coins[5] > 0)
				amount -= 5
			 $tmp_coins[5] -= 1
			elsif (((amount / 2) >= 1) && $tmp_coins[2] > 0)
				amount -= 2
			 $tmp_coins[2] -= 1
			elsif (((amount / 1) >= 1) && $tmp_coins[1] > 0)
				amount -= 1
			 $tmp_coins[1] -= 1
			end
		end
		return amount
	end

	def calculate_refund(amount)
		puts "Please collect your Rs #{amount} as refund"
		while(amount > 0) do
			if(((amount / 10) >= 1) && $coins[10] > 0)
				amount -= 10
				$coins[10] -= 1
				$refund_coins[10] += 1
			elsif (((amount / 5) >= 1) && $coins[5] > 0)
				amount -= 5
				$coins[5] -= 1
				$refund_coins[5] += 1
			elsif (((amount / 2) >= 1) && $coins[2] > 0)
				amount -= 2
				$coins[2] -= 1
				$refund_coins[2] += 1
			elsif (((amount / 1) >= 1) && $coins[1] > 0)
				amount -= 1
				$coins[1] -= 1
				$refund_coins[1] += 1
			end
		end
		puts "refund coins #{$refund_coins}"
	end


	if($quantity[$items.index($item)] >= quantity_to_dispense)
		$amount_to_pay = $prices[$items.index($item)] * quantity_to_dispense
		$amount_received = 0
		$quantity[$items.index($item)] -= quantity_to_dispense

		puts "We accept coins of 1,2,5 and 10 only"
		obj = VendingMachineAdvanced.new
		obj.dispense_item($amount_to_pay,$amount_received, quantity_to_dispense)
	else
		puts "Sorry, we just have #{$quantity[$items.index($item)]} #{$item} to dispense."
		exit		
	end
end