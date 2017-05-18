require './vending_machine_revised'

RSpec.describe VendingMachineRevised do
	context "check the functionality of vending machine" do
		obj = VendingMachineRevised.new
		it "if user select item number 2 and paid INR 70 then item will not dispensed" do
			result = obj.dispense_item(2,70)
			expect(result).to eql("Please pay INR 5 more to grab this item")
		end

		it "if user select item number 2 and paid INR 100 then item will dispense and INR 25 will be retured" do
			result = obj.dispense_item(2,100)
			expect(result).to eql("Thank you for buying item 2, your change is INR 25. Please come again!")
		end

		it "if user select item number 2 and paid INR 75 then item will dispense and INR 0 will be retured" do
			result = obj.dispense_item(2,75)
			expect(result).to eql("Thank you for buying item 2, your change is INR 0. Please come again!")
		end
	end
end