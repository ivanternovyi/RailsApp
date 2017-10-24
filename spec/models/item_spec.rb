require 'rails_helper'

RSpec.describe Item, :type => :model do
  it "should validate name" do
    item = create(:item, {name: "sdgsdg"})
    item.valid?
    item.errors[:name].empty?
  end

end
