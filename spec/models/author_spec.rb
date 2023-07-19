require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'Author associations' do
    it {should validate_presence_of(:name)}
    it {should have_many(:books).dependent(:destroy)}
  end
end