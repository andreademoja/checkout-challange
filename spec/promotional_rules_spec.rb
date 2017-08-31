require './lib/promotional_rules.rb'

describe Promotional_rules do

  it 'apply a 10% off if the total price is more than 60' do
    expect(subject.promo_ten(63.5)).to eq 57.15
  end

  it 'changes the cost of ties if user buys more than one' do
    expect(subject.promo_tie(2)).to eq 8.50
  end
end
