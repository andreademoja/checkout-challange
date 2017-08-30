require './lib/checkout.rb'

describe Checkout do

  it 'has a list of products on initialize' do
    expect(:products_list).not_to be_empty
  end

end
