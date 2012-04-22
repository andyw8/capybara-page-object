[![Build Status](https://secure.travis-ci.org/andyw8/capybara-page-object.png)](http://travis-ci.org/andyw8/capybara-page-object) [![Dependency Status](https://gemnasium.com/andyw8/capybara-page-object.png)](https://gemnasium.com/andyw8/capybara-page-object)

# capybara-page-object #

[Page Objects](http://code.google.com/p/selenium/wiki/PageObjects) for Capybara

## Installation ##

Gemfile

    gem 'capybara-page-object'

## Getting Started ##

features/catalog.feature

```gherkin
Feature: Catalog

  Scenario: Products available

    Given the products:
      | iPhone |
      | iPad   |
    When I visit the store
    Then those products should be listed
```

features/step_definitions/product_steps.rb

```ruby
Given /^the products:$/ do |table|
  @products = table.raw.flatten.map { |p| Product.create!(:title => p) }
end

When /^I visit the store$/ do
  @page = Pages::Products::Index.visit
end

Then /^those products should be listed$/ do
  @page.product_titles.should == @products.map{ |p| p.title }
end
```

features/pages/products/index.rb

```ruby
module Pages
  module Products
    class Index < CapybaraPageObject::Page
      
      path 'products'

      component :navigation { Components::Navigation.new find('#nav') }
      component :product_list { Components::ProductList.new find('#products') }

      def product_titles
        product_list.titles
      end
    end
  end
end

module Compnents
  class ProductList < CapybaraPageObject::Component
    def titles
      source.all('.title').collect(&:text)
    end
  end
end
```

## Usage ##

Create a class to represent a page, component or element, and include the appropriate module:

* CapybaraPageObject::Page to represent a whole page
* CapybaraPageObject::Component to represent part of a page (e.g. a sidebar)
* CapybaraPageObject::Element to represent a single element (e.g. a <footer> tag)

## Best Practices ##

* Avoid CSS or XPath selectors in your step definitions - do this within the page/component/element objects
* Avoid assertions in the page models themselves - do this in the step definitions

## Demo Project ##

[Depot](https://github.com/andyw8/depot)

## Contributing to capybara-page-object ##

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright ##

Copyright (c) 2012 Andy Waite. See LICENSE.txt for
further details.
