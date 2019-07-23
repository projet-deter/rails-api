require "rails_helper"

RSpec.describe Comment, type: :model do
  subject {
    user = User.new(
      email: 'tony@stark.com',
      password: 'azerty',
      name: 'Tony Stark'
    )
    category = Category.new(name: "Catégorie")
    article = Article.new(
      title: 'Un nouvel article',
      description: 'Ceci est un nouvel article',
      user: user,
      category: category
    )
    described_class.new(
      body: 'Ceci est un commentaire',
      user: user,
      article: article
    )
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
