class Alcohol
  # NOTE: お酒の銘柄を適用に入れたい
  BRANDS = %w[a b c].freeze
  def initialize(brand)
    @brand = brand
  end
end
