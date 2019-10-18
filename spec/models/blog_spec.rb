require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'has a valid factory' do
    expect(create(:blog)).to be_valid 
  end

  describe 'assocations' do
    it { should have_many(:comments) } 
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:image) }  
  end
  
 
  
end
