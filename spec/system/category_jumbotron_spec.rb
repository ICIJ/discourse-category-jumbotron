# frozen_string_literal: true

require_relative "page_objects/components/category_jumbotron"

RSpec.describe "Category Jumbotron", type: :system do
  let!(:theme) { upload_theme_component }
  fab!(:category) { Fabricate(:category, description: "<p>this is some description</p>") }
  fab!(:category_subcategory) do
    Fabricate(:category, parent_category: category, description: "some description")
  end
  let(:category_jumbotron) { PageObjects::Components::Categoryjumbotron.new(category) }
  let(:subcategory_jumbotron) { PageObjects::Components::Categoryjumbotron.new(category_subcategory) }

  it "displays category jumbotron correctly" do
    visit(category.url)

    expect(category_jumbotron).to be_visible
    expect(category_jumbotron).to have_title(category.name)
    expect(category_jumbotron).to have_description("this is some description")
  end

  it "should not display category jumbotron on subcategories when `max_level` setting is 0" do
    theme.update_setting(:max_level, 0)
    theme.save!

    visit(category_subcategory.url)

    expect(subcategory_jumbotron).to be_not_visible
  end
end