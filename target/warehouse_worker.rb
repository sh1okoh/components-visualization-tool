class WarehouseWorker
  def initialize(workat, invoice, stored, ship_request, ship_status)
    @workat = workat
    @invoice = invoice
    @stored = stored
    @ship_request = ship_request
    @ship_status = ship_status
  end

  def update_storage_in(inv)
    invoice = inv
    @stored.clear()
    elements = inv.elements;
    elements.each do |element|
      @workat.store
    end
  end
end