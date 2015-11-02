# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
load 'db/seeds/userstocks.rb'

#Stock.delete_all
#yahoo_client = YahooFinance::Client.new
#symbols = yahoo_client.symbols_by_market('us', 'nyse')
#data = yahoo_client.quotes(symbols, [:symbol, :name, :ask, :change])
#date = Time.new
#lastItemName = ''
#for item in data
#  if item.name == 'N/A'
#    item.name = lastItemName
#  end
#  ticker = Stock.create("ticker": item.symbol, "name": item.name, "current_price": item.ask, "change": item.change, "updated": date)
#  lastItemName = item.name
#end
