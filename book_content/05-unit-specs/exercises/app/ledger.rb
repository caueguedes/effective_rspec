module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  class Ledger
    def expenses_on(date)
    end

    def record(expense)
    end
  end
end