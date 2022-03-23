class ShopWorker
  def initialize(backorder)
    @backorder = backorder
    p "初期値"
    p @backorder.to_string

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

  end
end
