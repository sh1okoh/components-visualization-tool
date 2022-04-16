require_relative 'stock_record'
require_relative 'table'

class Stock
  attr_accessor :table

  def initialize
    @table = Table.new
  end

  def append(stock_record)
    @table.append(stock_record)
  end

  def to_string
    @table.rep.each do |stock_record|
      pp "#{stock_record.brand}: #{stock_record.quantity}個"
    end
  end

  def is_inventory_shortage(ordered_brand)
    result = false
    required_quantity = 0
    requester = nil
    @table.rep.each do |stock_record|
      if stock_record.brand == ordered_brand
        result = stock_record.quantity < 0
        required_quantity = stock_record.quantity

      end
    end

    return [result, required_quantity]
  end
end
