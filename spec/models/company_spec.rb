require 'rails_helper'

RSpec.describe Company, type: :model do
    context 'validations' do
        let!(:company){Company.new}
        it 'does not accept without a name' do
            company.cik = 100
            company.ticker = "EWL"
            expect(company).to_not be_valid
            expect(company.errors).to be_present
            expect(company.errors.to_hash.keys).to include(:name)
        end
        it 'does not accept without a cik' do
            company.name = "EWL, Inc."
            company.ticker = "EWL"
            expect(company).to_not be_valid
            expect(company.errors).to be_present
            expect(company.errors.to_hash.keys).to include(:cik)
        end
        
        it 'does not accept without a ticker' do
            company.name = "EWL, Inc."
            company.cik = 100
            expect(company).to_not be_valid
            expect(company.errors).to be_present
            expect(company.errors.to_hash.keys).to include(:ticker)
        end

        it 'does not accept an existing ticker' do
            company.cik = 100
            company.name = "EWL, Inc."
            company.ticker = "EWL"

            expect(company).to_not be_valid
            expect(company.errors).to be_present
            
            company.save

            another_company = Company.new
            another_company.cik = 101
            another_company.name = "Another EWL, Inc."
            another_company.ticker = "EWL"
            expect(another_company).to_not be_valid
        end
    end

    describe '#get_change' do
        it 'returns percentage of change' do
            comp = Company.create(cik: 1, name: 'Erma Win, Inc.', ticker: 'EWL')
            expect(comp.get_change).to eq(0)
        end       
    end
end