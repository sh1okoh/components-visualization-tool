# NOTE: 積荷票
class PackingSlip
  def initialize(container, time_zone_now)
    # NOTE:
    # - コンテナ番号
    # - 搬入年月日、日時
    # - 内蔵品名, 数量
    @container_number = container.number
    @delivery_date = time_zone_now
    @alcohol_info = make_alcohol_info(container)
  end

  def make_alcohol_info(container)
    alcohol_info = Array.new(Hash.new)
  end
end
