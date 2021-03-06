require_relative 'warehouse_worker'
require_relative 'packing_slip'
require_relative 'receptionist'
require_relative 'alcohol'
require_relative 'container'
require_relative 'stock_record'
require_relative 'stock'
require_relative 'requester'

class WarehouseService
  class << self
    def run
      # 倉庫係がコンテナを受け取る
      prepared_stock = make_stock
      container = make_container
      order = make_order
      # 在庫の準備
      # 倉庫係がコンテナを倉庫に保管する
      @warehouse_worker= WarehouseWorker.new
      @warehouse_worker.store(container)
      # 倉庫係が積荷票を受付係へ手渡す
      @packing_slip = PackingSlip.new(container, Time.now)
      @receptionist = Receptionist.new
      @receptionist.receive_packing_slip(@packing_slip)
      # 受付係の出庫指示によって内蔵品を出庫する
      # - 受付係は毎日n*10件の出庫依頼を受け、倉庫係へ出庫指示書を出す
      # - 出庫依頼は出庫依頼票もしくは電話、1件1銘柄
      # - 在庫がないか、不足の場合にはその旨を依頼者に電話連絡し、同時に在庫不足リストに記入する
      # - また空になる予定のコンテナを倉庫係に知らせることになっている
      stock_record, ordered = @receptionist.calculate_inventory(order, prepared_stock)
      if (stock_record.quantity.negative?)
        @receptionist.call_requester(ordered)
        @receptionist.write_inventory_shortage(ordered[:order], stock_record)
        return
      elsif(stock_record.quantity == 0)
        @receptionist.inform_of_warehouse_worker(@warehouse_worker)
      end
    end

    private

    def make_container
      alcohol = Alcohol.new('a')
      container = Container.new
      container.alcohol_table.append(alcohol)
      container
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

    def make_order
      requester_a = Requester.new('request_a', 'company_a')
      requester_b = Requester.new('requester_b', 'company_b')
      requester_c = Requester.new('requester_c', 'company_c')
      [
        { requester: requester_a, order: requester_a.order('a', 20, 'company_b') },
        { requester: requester_b, order: requester_b.order('b', 30, 'company_c') },
        { requester: requester_c, order: requester_c.order('c', 40, 'company_a') },
      ]
    end
  end
end

WarehouseService.run
