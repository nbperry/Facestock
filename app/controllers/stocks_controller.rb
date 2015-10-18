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
    #for now we'll get them here
    @stocks = Stock.all
  end
  def data
    #default values
    page = 1
    results = 50
    order = 'default'

    #any mods
    if(params.has_key?(:page))
      if params[:page].to_i > 0
        page = params[:page].to_i
      end
    end
    if(params.has_key?(:results))
      if params[:results].to_i > 0
        results = params[:results].to_i
      end
    end

    #return data from the database for ajax calls
    stocks = Stock.limit(results).offset((page-1)*results)
    render :json => stocks
  end
end
