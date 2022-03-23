require_relative 'table'

class Backorder
  def initialize(s)
    @name = s
    @shorts = Table.new
  end

  def inc(r)
    @shorts.inc(r)
  end

  def dec(r)
    @shorts.dec(r)
  end

  def supply(r)
    @shorts.dec(r)
  end

  def check(key)
    @shorts.fetch(key)
  end

  def is_empty
    @shorts.is_empty
  end

  def to_string
    r = "Backorder:"+@name+"\n"
    shorts_size = @shorts.size
    r += "count"+shorts_size.to_s+"\n"
    r += @shorts.to_string
    r
  end

  def total_price
    @shorts.total_price
  end
end
