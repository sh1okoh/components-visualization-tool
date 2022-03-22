require_relative 'stock_record'


class Table
  def initialize
    @rep = Array.new(Hash.new)
  end

  # x: StockRecord
  def inc(x)
    key = x.brand.key()
    r = @rep.fetch(key)
    if r != null
      v = sum(r.qty, x.qty)
      s = StockRecord.new(x.brand, v)
      x = s
    end
    @rep.store(key, x)
  end

  # todo: わからない
  # def inc_all(table_array)
  #   table_array.each do |table|
  #
  #   end
  # end
  def put(x)
    key = x.brand.key()
    r = @rep.fetch(key)
    if !r.nil?
      v = x.qty
      s = StockRecord.new(x.brand, v)
      x = s
    end
    @rep.store(key, x)
  end

  def dec(x)
    f = true
    key = x.brand.key()
    r = @rep.fetch(key)
    qty = diff(r.qry, x.qty)
    if !r.nil?
      if (qty > 0)
        s = StockRecord.new(x.brand, qty)
        x = s
        @rep.store(key, x)
      else
        @rep.delete(key)
      end
    else
      f = false
    end
    f
  end

  def fetch(key)
    r = @rep.fetch(key)
    if (r != null)
      return r.qty
    else
      return 0
    end
  end

  def total_price
    total = 0
    @rep.each do |rep|
      total += rep
    end
    total
  end

  private

  def sum(x1, x2)
    x1 + x2
  end

  def diff(x1, x2)
    x1 - x2
  end

end
