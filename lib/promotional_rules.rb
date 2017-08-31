require './lib/checkout.rb'

class Promotional_rules

  def promo_ten(total)
    discount = 0.1
    total -=total * discount
    total.round(2)
  end
end
