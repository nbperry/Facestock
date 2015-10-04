class StocksController < ApplicationController
  def index
    yahoo_client = YahooFinance::Client.new
    @symbols = yahoo_client.symbols_by_market('us', 'nyse')
    @data = yahoo_client.quotes(@symbols, [:symbol, :name, :ask, :change])
    @stocks = Array.new
    date = '10/04/2015'
    for item in @data
      ticker = Stock.new(ticker: item.symbol, name: item.name, current_price: item.ask, change: item.change, updated: date)
      @stocks << ticker
    end
  end
end
