require 'yaml'
require './lib/promotional_rules.rb'

class Checkout
  attr_accessor :products_list, :cart

  def initialize
    @cart = []
    @products_list = YAML.load_file('./lib/data.yml')
  end

  def add_to_cart(product)
    @cart.push(product)
  end

  def total_cost
    @total_value = 0
    @cart.each do |code|
      product = products_list.detect { |obj| obj[:product][:code] == code }
      @total_value += product[:product][:price]
    end
    if @total_value < 60
      return @total_value
    else
      promo = Promotional_rules.new
      return promo.promo_ten(@total_value)
    end
  end


end
