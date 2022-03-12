class Warehouse
  def initialize(name)
    @name = name
    @stocks = Table.new
  end

  def store(record)
    @stocks.inc(record)
  end

  def load(record)
    @stocks.dec(record)
  end

  def number(key)
    @stocks.get(key)
  end

  def total_price
    @stocks.total_price
  end

  def to_string
    r = "Warehouse: #{@name}"
    stocks_size = @stocks.size
    r += "size=#{r.length}\n"
    r += @stocks.to_string
    r
  end
end
