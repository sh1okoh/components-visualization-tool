require_relative 'stock_record'

class Stock
  attr_accessor :table

  def initialize
    @table = Array.new
  end

  def stock(stock_record)
    @table.append(stock_record)
  end

  def to_string
    @table.each do |stock_record|
      pp "#{stock_record.brand}: #{stock_record.quantity}個"
    end
  end
end
