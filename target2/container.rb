class Container
  attr_accessor :alcohol_store, :number

  def initialize
    @alcohol_store = Array.new
    @number = 1
  end

  def append(alcohol)
    @alcohol_store.append(alcohol)
  end
end
