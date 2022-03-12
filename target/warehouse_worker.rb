class WarehouseWorker
  def initialize(workat)
    @workat = workat
    @invoice = Table.new
    @stored = Table.new
    @ship_request = Table.new
    @ship_status = ShipStatus.new

    puts "初期値"
    puts @workat.to_s
  end


  # 入庫在庫更新
  # in : invoice 積荷票
  # out : stored 入庫票
  def update_storage_in(inv)
    invoice = inv
    @stored.clear()
    elements = inv.elements;
    elements.each do |element|
      @workat.store(element)
      @stored.put(element)
    end

    puts "入庫 : #{@stored.to_s}"
    return @stored
  end

  # 出庫在庫更新
  #   in : ship_request 出庫指示書
  #   out : st
  def update_storage_out(request)
    @ship_request = request

    @ship_status.loaded.clear()
    @ship_status.shortage.clear()
    elements = @ship_request.elements()
    elements.each do |element|
      # 在庫があれば出庫票に、なければ不足票に追加
      qty = @workat.number(element.brand.key())
      if qty >= element.qty.intValue()
        workat.load(element)
        @ship_status.loaded.put(element)
      else
        @ship_status.shortage.put(element)
      end
    end

    if !@ship_status.shortage.isEmpty()
      elements = @ship_status.loaded.elements()
      elements.each do |element|
        @workat.store(element)
        @ship_status.shortage.put(element)
      end
      @ship_status.loaded.clear()
    end

    puts "出庫 : #{@ship_status.loaded.to_s}"
    puts "不足 : #{@ship_status.shortage.to_s}"
  end

  def test; end
end