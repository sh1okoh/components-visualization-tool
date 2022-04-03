class Table
  attr_accessor :rep

  def initialize
    @rep = Array.new
  end

  def append(record)
    @rep.append(record)
  end
end
