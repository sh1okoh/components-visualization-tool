# 毎日数個のコンテナ
# 1つのコンテナには10銘柄を混載。全部で200種類
# 倉庫係はコンテナを受け取りそのまま倉庫に保管し、積み荷票を受け取る
#
#
class Table
  def initialize
    @rep = Hash.new
  end

  def inc(x)
    key = x.brand.key()
    r = rep.get(key)
    if r != null
      v = sum(1, 2)
    end
  end

  private

  def sum(x1, x2)
    return x1 + x2
  end
end
