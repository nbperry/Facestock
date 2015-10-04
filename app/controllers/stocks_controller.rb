class StocksController < ApplicationController
  require 'json'
  require 'ostruct'
  def stock
    #get stocks from yahoo into data, chart info is for the interactive chart
    yahoo_client = YahooFinance::Client.new
    #this is the stock you will get
    @stock = params[:ticker]
    chart = yahoo_client.historical_quotes(@stock, { start_date: Time::now-(24*60*60*30), end_date: Time::now })
    data = yahoo_client.quote([@stock], [:ask, :high, :low, :high_52_weeks, :low_52_weeks, :previous_close, :close, :name], {raw: false})
    #set everything that you will be using on the page
    @ask = data.ask
    @high = data.high
    @low = data.low
    @high52 = data.high_52_weeks
    @low52 = data.low_52_weeks
    @lastclose = data.previous_close
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
    @show = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Stock History For " + @name)
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
end
