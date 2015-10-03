class StocksController < ApplicationController
  require 'json'
  require 'ostruct'
  def stock
    yahoo_client = YahooFinance::Client.new
    @stock = params[:ticker]
    @chart = yahoo_client.historical_quotes(@stock, { start_date: Time::now-(24*60*60*5), end_date: Time::now })
    data = yahoo_client.quote([@stock], [:ask, :high, :low, :high_52_weeks, :low_52_weeks, :previous_close, :close, :name], {raw: false})
    @ask = data.ask
    @high = data.high
    @low = data.low
    @high52 = data.high_52_weeks
    @low52 = data.low_52_weeks
    @lastclose = data.previous_close
    @close = data.close
    @name = data.name
  end
  def create

  end
  def destroy

  end
end
