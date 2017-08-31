require 'yaml'
require './lib/promotional_rules.rb'

class Checkout
  attr_accessor :products_list, :cart

  def initialize
    @total_value = 0.00
    @cart = []
    @products_list = YAML.load_file('./lib/data.yml')
  end

  def add_to_cart(product)
    @cart.push(product)
  end

  def total_cost
    number_of_ties = @cart.group_by(&:itself).map { |k,v| [k, v.count] }.to_h[1]
    iterate_through_items(number_of_ties)
    check_value
  end


private

  def check_value
    if @total_value < 60
      return @total_value
    else
      promo = Promotional_rules.new
      return promo.promo_ten(@total_value)
    end
  end

  def check_ties(number_of_ties, product)
    if number_of_ties.to_i > 1 && product[:product].key?(:bundle_price)
      @total_value += product[:product][:bundle_price]
    else
      @total_value += product[:product][:price]
    end
  end

  def iterate_through_items(number_of_ties)
    @cart.each do |code|
      product = products_list.detect { |obj| obj[:product][:code] == code }
      check_ties(number_of_ties, product)
    end
  end
end
