require 'yaml'

class Checkout
  attr_accessor :products_list

  def initialize
    @products_list = YAML.load_file('.lib/data.yml')
  end

end
