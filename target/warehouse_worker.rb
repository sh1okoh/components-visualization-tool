class WarehouseWorker
  def initialize(workat, invoice, stored, ship_request, ship_status)
    @workat = workat
    @invoice = invoice
    @stored = stored
    @ship_request = ship_request
    @ship_status = ship_status
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
      # 在庫があればしゅっこひょうに、なければ不測表に追加
      
    end
  end
end