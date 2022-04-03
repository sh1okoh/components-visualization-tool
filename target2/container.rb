class Container
  attr_accessor :alcohol_store, :number

  def initialize
    @alcohol_store = Array.new
    # TODO: コンテナ番号を計算して出すようにする
    # - 実装案:
    #   - container を保村しているテーブルから、コンテナ数を数えて、コンテナ数+1をした番号にする
    #   - 適当にユニークな番号にする
    @number = 1
  end

  def append(alcohol)
    @alcohol_store.append(alcohol)
  end
end
