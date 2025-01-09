require 'rails_helper'

RSpec.describe CalculatorsController, type: :controller do
  describe "add" do
    context 'with valid input' do
      it 'returns the sum of numbers' do
        get :add, params: { string: '1,2,3' }
        expect(JSON.parse(response.body)).to eq('output' => 6)
      end

      it 'ignores numbers greater than 1000' do
        get :add, params: { string: '2,1001,3,9999' }
        expect(JSON.parse(response.body)).to eq('output' => 5)
      end
    end

    context 'with negative numbers' do
      it 'raises an error when negative numbers are present' do
        get :add, params: { string: '-1,2,-3' }
        expect(JSON.parse(response.body)).to eq('error' => 'negatives not allowed [-1, -3].')
      end
    end

    context 'with invalid input' do
      it 'handles special characters' do
        get :add, params: { string: '///1***2\n3;4%5[6]' }
        expect(JSON.parse(response.body)).to eq('output' => 21)
      end

      it 'handles nil value' do
        get :add
        expect(JSON.parse(response.body)).to eq('error' => 'No string passed.')
      end
    end
  end
end
