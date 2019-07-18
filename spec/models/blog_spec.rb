require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'has a valid factory' do
    expect(create(:blog)).to be_valid 
  end
end
