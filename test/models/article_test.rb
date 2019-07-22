require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  title = 'Un nouvel article'
  description = 'Ceci est un nouvel article'
  category_id = 1

  # ALL FIELDS
  test "Should not save article without fields" do
    article = Article.new
    assert_not article.save, "Saved the article without a fields"
  end

  # TITLE
  test "Should not save article without title" do
    article = Article.new(description: description, category_id: category_id)
    assert_not article.save, "Saved the article without a title"
  end

  test "Should not save article with an empty title" do
    article = Article.new(title: '', description: description, category_id: category_id)
    assert_not article.save, "Saved the article with an empty title"
  end

  # DESCRIPTION
  test "Should not save article without description" do
    article = Article.new(title: title, category_id: category_id)
    assert_not article.save, "Saved the article without a description"
  end

  test "Should not save article with an empty description" do
    article = Article.new(title: title, description: '', category_id: category_id)
    assert_not article.save, "Saved the article with an empty description"
  end

  # CATEGORY_ID
  test "Should not save article without a category" do
    article = Article.new(title: title, description: description)
    assert_not article.save, "Saved the article without a category"
  end

  test "Should not save article with an empty category" do
    article = Article.new(title: title, description: description, category_id: 0)
    assert_not article.save, "Saved the article with an empty category"
  end
end
