require_relative 'warehouse_worker'
require_relative 'packing_slip'
require_relative 'receptionist'
require_relative 'alcohol'
require_relative 'container'
require_relative 'stock_record'
require_relative 'stock'

class WarehouseService
  def run
    # 倉庫係がコンテナを受け取る
    container = make_container
    # 倉庫係がコンテナを倉庫に保管する
    WarehouseWorker.new.store(container)
    packing_slip = PackingSlip.new(container, Time.zone.now)
    # 倉庫係が積荷票を受付係へ手渡す
    Receptionist.new.receive_packing_slip(packing_slip)

    # 在庫の準備
    make_stock
    # ==================================
    # 受付係の出庫指示によって内蔵品を出庫する
    # - 受付係は毎日n*10件の出庫依頼を受け、倉庫係へ出庫指示書を出す
    # - 出庫依頼は出庫依頼票もしくは電話、1件1銘柄
    # - 在庫がないか、不足の場合にはその旨を依頼者に電話連絡し、同時に在庫不足リストに記入する
    # - また空になる予定のコンテナを倉庫係に知らせることになっている
    alcohol = Alcohol.new('b')
    is_inventory_shortage = Receptionist.new.receive_delivery_request(alcohol)
    if (is_inventory_shortage)

    else

    end
  end

  def make_container
    alcohol = Alcohol.new('a')
    Container.new.append(alcohol)
  end

  def make_stock
    stock_record1 = StockRecord.new('a', 10)
    stock_record2 = StockRecord.new('b', 20)
    stock_record3 = StockRecord.new('c', 30)
    stock_records = [stock_record1, stock_record2, stock_record3]
    stock = Stock.new
    stock_records.each do |stock_record|
      stock.append(stock_record)
    end
    stock
  end
end
