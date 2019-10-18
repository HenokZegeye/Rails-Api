require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'has a valid factory' do
    expect(create(:comment)).to be_valid 
  end

  describe 'association validation' do
    it { should belong_to(:blog) } 
  end

  describe 'presence validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:comment) }    
  end
  
end
