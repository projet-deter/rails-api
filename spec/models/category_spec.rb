require "rails_helper"

RSpec.describe Category, type: :model do
  subject {
    described_class.new(name: 'Test')
  }

  describe 'validation' do
    # IS VALID
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    # NAME
    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
