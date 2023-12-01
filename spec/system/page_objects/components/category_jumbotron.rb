# frozen_string_literal: true

module PageObjects
  module Components
    class CategoryJumbotron < PageObjects::Components::Base
      def initialize(category)
        @category = category
      end

      def visible?
        has_css?(category_banner_selector)
      end

      def not_visible?
        has_no_css?(category_banner_selector)
      end

      def has_title?(title)
        has_css?("#{category_banner_selector} .category-jumbotron__grid__content__heading__name", text: title)
      end

      def has_description?(description)
        has_css?(
          "#{category_banner_selector} .category-jumbotron__grid__content__description .cooked",
          text: description,
        )
      end

      def has_no_description?
        has_no_css?("#{category_banner_selector} .category-jumbotron__grid__content__description")
      end

      private

      def category_banner_selector
        ".category-jumbotron-#{@category.slug}"
      end
    end
  end
end
