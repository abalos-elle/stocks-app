require 'rails_helper'

RSpec.describe Company, type: :model do
    context 'validations' do
        let!(:company){Company.new}
        it 'is a not valid company' do
            company.name = "Erma Win, Inc."
            expect(company).to_not be_valid
            expect(company.errors).to be_present
            expect(company.errors.to_hash.keys).to include(:cik)
        end
        
        it 'is a not valid company' do
            company.name = "Erma Win, Inc."
            expect(company).to_not be_valid
            expect(company.errors).to be_present
            expect(company.errors.to_hash.keys).to include(:ticker)
        end
    end

    describe '#get_change' do
        it 'returns percentage of change' do
            comp = Company.create(cik: 1, name: 'Erma Win, Inc.', ticker: 'EWL')
            expect(comp.get_change).to eq(0)
        end       
    end
end