require_relative 'stock_record'

class Stock
  def initialize
    @stock = Array.new
  end

  def stock(stock_record)
    @stock.append(stock_record)
  end

  def to_string
    @stock.keys.each do |key|
      pp "#{key}: #{@stock[key]}個"
    end
  end
end
