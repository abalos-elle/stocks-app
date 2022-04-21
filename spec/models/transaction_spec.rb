require 'rails_helper'

RSpec.describe Transaction, type: :model do
    context 'validations' do
        let!(:transaction){Transaction.new}
        it 'does not accept a negative number for quantity to buy/sell' do
            d = DateTime.now
            transaction.code = d.strftime("%Y%m%d%H%M%s")    
            transaction.type = 1
            transaction.company_id = 31
            transaction.user_id = 22
            transaction.quantity = -100
            transaction.price = 0.47

            expect(transaction).to_not be_valid
            expect(transaction.errors).to be_present
            expect(transaction.errors.to_hash.keys).to include(:quantity)
        end
        it 'does not accept a decimal number for quantity to buy/sell' do
            d = DateTime.now
            transaction.code = d.strftime("%Y%m%d%H%M%s")    
            transaction.type = 1
            transaction.company_id = 31
            transaction.user_id = 22
            transaction.quantity = 1.5
            transaction.price = 0.47

            expect(transaction).to_not be_valid
            expect(transaction.errors).to be_present
            expect(transaction.errors.to_hash.keys).to include(:quantity)
        end
    end
end