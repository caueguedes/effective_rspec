require 'sinatra/base'
require 'json'

module  ExpenseTracker
  class API < Sinatra::Base

    post '/expenses' do
      expense = JSON.parse(request.body.read)
      result = @ledger.record(expense)
      JSON.generate('expense_id': 42)

    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end