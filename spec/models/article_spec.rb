require "rails_helper"

RSpec.describe Article, type: :model do
  subject {
    user = User.new(
      email: 'tony@stark.com',
      password: 'azerty',
      name: 'Tony Stark'
    )
    category = Category.new(name: "Catégorie")
    described_class.new(
      title: 'Un nouvel article',
      description: 'Ceci est un nouvel article',
      user: user,
      category: category
    )
  }

  # describe "Associations" do
  #   # USER
  #   it "has one User" do
  #     assc = described_class.reflect_on_association(:user)
  #     expect(assc.macro).to eq :has_one
  #   end
  
  #   # CATEGORY
  #   it "has one Category" do
  #     assc = described_class.reflect_on_association(:category)
  #     expect(assc.macro).to eq :has_one
  #   end
  # end

  describe 'Validations' do
    # IS VALID
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    # TITLE
    it 'is not valid without title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    # DESCRIPTION
    it 'is not valid without description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end
