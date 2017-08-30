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


end
