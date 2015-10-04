class StocksController < ApplicationController
  require 'json'
  require 'ostruct'
  def stock
    #get stocks from yahoo into data, chart info is for the interactive chart
    yahoo_client = YahooFinance::Client.new
    #this is the stock you will get
    @stock = params[:ticker]
    if( params.has_key?(:ticker))
      chart = yahoo_client.historical_quotes(@stock, { start_date: Time::now-(24*60*60*30), end_date: Time::now })
      data = yahoo_client.quote([@stock], [:ask, :high, :low, :high_52_weeks, :low_52_weeks, :close, :name], {raw: false})
      #set everything that you will be using on the page
      @ask = data.ask
      @high = data.high
      @low = data.low
      @high52 = data.high_52_weeks
      @low52 = data.low_52_weeks
      @close = data.close
      @name = data.name
      #make the chart 2d array
      xy = []
      dates = []
      values = []
      chart.each do |this|
        dates.unshift(this[:trade_date])
        values.unshift(this[:close].to_f)
      end
    else
      @ask = 'N/A'
      @high= 'N/A'
      @low= 'N/A'
      @high52 = 'N/A'
      @low52 = 'N/A'
      @close = 'N/A'
      @name = 'Please Enter A Valid Ticker'
      @stock = 'N/A'
    end
    @show = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => @name)
      f.xAxis(:categories => dates)
      f.series(:name => "Closing Value", :yAxis => 0, :data => values)
      f.yAxis [
                  {:title => {:text => "Value in Dollars"}}
              ]
      f.chart({:defaultSeriesType=>"line"})
    end
  end
  def create

  end
  def destroy

  end

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
