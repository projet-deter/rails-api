require "rails_helper"

RSpec.describe Comment, type: :model do
  subject {
    described_class.new(body: 'Ceci est un commentaire')
  }

  describe 'validation' do
    # IS VALID
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    # BODY
    it 'is not valid without body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end
  end
end
