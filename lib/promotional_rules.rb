require './lib/checkout.rb'

class Promotional_rules

  def promo_ten(total)
    discount = 0.1
    total -=total * discount
    total.round(2)
  end

  def promo_tie
    co  = Checkout.new
    product = co.products_list.detect { |obj| obj[:product][:code] == 1 }
    return product[:product][:bundle_price]
  end
end
