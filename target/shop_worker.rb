class ShopWorker
  def initialize(backorder)
    @backorder = backorder
    @ship_req = Table.new
    @stored = Table.new
    @shipped = Table.new
    @shortage = Table.new
    @supplied = Table.new
  end

  # 出庫依頼
  # in : orderform.order      注文書
  # out: shipreq              出庫依頼書
  def ship_out(form)
    order_form = form
    @ship_req.clear()
    order_form.order.values.each do |r|
      
    end

  end
end
