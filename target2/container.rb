require_relative 'table'

class Container
  attr_accessor :alcohol_table, :number

  def initialize
    @alcohol_table = Table.new
    # TODO: コンテナ番号を計算して出すようにする
    # - 実装案:
    #   - container を保存しているテーブルから、コンテナ数を数えて、コンテナ数+1をした番号にする
    #   - 適当にユニークな番号にする
    @number = 1
  end

  def append(alcohol)
    @alcohol_table.append(alcohol)
  end
end
