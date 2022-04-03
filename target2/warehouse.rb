require_relative 'table'

class Warehouse
  attr_accessor :table

  def initialize
    @table = Table.new
  end
end
