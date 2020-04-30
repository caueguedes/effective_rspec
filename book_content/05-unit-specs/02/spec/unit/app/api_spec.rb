require_relative  '../../../app/api'

module ExpenseTracker
  RSpec.describe "API" do
    describe 'POST /expense' do
      context 'when the expense is successfully recorded' do
        it 'returns the expense id'
        it 'returns with a 200 (OK) '

      end

      context 'when the expense fails validation' do
        it 'returns an error message'
        it 'responds with a 422 (Unprocessable entity)'

      end

    end
  end
end