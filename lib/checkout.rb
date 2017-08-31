require 'yaml'

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
    @cart.each do |code|
      product = products_list.detect { |obj| obj[:product][:code] == code }
      product[:product][:price]
    end
  end


end
