require_relative '../config/sequel'

module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  class Ledger
    def expenses_on(date)
      DB[:expenses].where(date: date).all
    end

    def record(expense)
      message = ''
      message << "Invalid expense: `payee` is required\n" unless(expense.key?('payee'))
      message << "Invalid expense: `date` is required\n" unless(expense.key?('date'))
      message << "Invalid expense: `amount` is required\n" unless(expense.key?('amount'))
      if expense.key?('amount')
        message << "Invalid expense: `amount equal zero` is not accepted\n" if(expense['amount'] == 0 )
        message << "Invalid expense: `negative amount` is not accepted\n" if(expense['amount'] < 0)
      end

      return RecordResult.new(false, nil, message) unless message.empty?

      DB[:expenses].insert(expense)
      id = DB[:expenses].max(:id)
      RecordResult.new(true, id, nil)
    end
  end
end