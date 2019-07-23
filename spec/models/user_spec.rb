require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      email: 'tony@stark.com',
      password: 'azerty',
      name: 'Tony Stark'
    )
  }

  describe 'validation' do
    # IS VALID
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    # EMAIL
    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if email have not the email format' do
      subject.email = 'tony.com'
      expect(subject).to_not be_valid
    end

    context 'when email is not unique' do
      before {
        described_class.create!(
          email: 'tony@stark.com',
          password: 'azerty',
          name: 'Tony Stark'
        )
      }
      it {
        expect(subject).to be_invalid
      }
    end    

    context 'when email is unique' do
      before {
        described_class.create!(
          email: 'morgan@stark.com',
          password: 'azerty',
          name: 'Morgan Stark'
        )
      }
      it {
        expect(subject).to be_valid
      }
    end

    # PASSWORD
    it 'is not valid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    # NAME
    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
