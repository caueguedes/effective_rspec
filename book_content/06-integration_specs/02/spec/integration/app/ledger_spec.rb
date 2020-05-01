require_relative '../../../app/ledger'
require_relative '../../../config/sequel'
require_relative '../../support/db'

module ExpenseTracker
  RSpec.describe Ledger, :aggregate_failures do
    let(:ledger) { Ledger.new }
    let(:expense) do
      {
          'payee'   => 'Starbucks',
          'amount'  => 5.75,
          'date'    => '2017-06-10'
      }
    end

    describe '#record' do
      context 'with a valid expense' do
        # it 'successufully saves the expense in the DB', :aggregate_failures do
        it 'successufully saves the expense in the DB', :aggregate_failures do
          result = ledger.record(expense)

          expect(result).to be_success
          expect(DB[:expenses].all).to match [a_hash_including(
                                                  id: result.expense_id,
                                                  payee: 'Starbucks',
                                                  amount: 5.75,
                                                  date: Date.iso8601('2017-06-10')
                                              )]
        end
      end #context success
    end #describe
  end
end