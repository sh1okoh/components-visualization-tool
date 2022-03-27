class Alcohol
  # NOTE: お酒の銘柄を適用に入れたい
  BRANDS = %w[a b c].freeze
  def initialize(brand)
    @brand = validate_brand(brand)
  end

  def validate_brand(brand)
     unless BRANDS.include?(brand)
       raise Exception.new("invalid brand: #{brand}")
       # TODO: 不正な値の場合の値を返すようにしたい
     end

    brand
  end
end
