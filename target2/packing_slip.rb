# NOTE: 積荷票
class PackingSlip
  def initialize(container, time_zone_now)
    # NOTE:
    # - コンテナ番号
    # - 搬入年月日、日時
    # - 内蔵品名, 数量
    #   - [ { "内蔵品名": 数量 } ]
    @container_number = container.number
    @delivery_date = time_zone_now
    @alcohol_info = make_alcohol_info(container)
  end

  private

  def make_alcohol_info(container)
    alcohol_store = container.alcohol_store
    info = alcohol_store.group_by(&:itself).map { |key, value| [key, value.count] }.to_h
    info
  end
end
