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

module Components
  class ProductList < CapybaraPageObject::Component
    def titles
      source.all('.title').collect(&:text)
    end
  end
end
```

## Usage ##

Create a class to represent a page, component or element, and include the appropriate module:

### CapybaraPageObject::Page ###

CapybaraPageObject::Page represents a whole page.
You must define the path by:

* either using the `Page.path` class method

```ruby
module Pages::Products
  class Index < CapybaraPageObject::Page
    path 'products'
  end
end
```

* or by directly overriding the `path` instance method

```ruby
module Pages::Products
  class Index < CapybaraPageObject::Page
    def path
      'products'
    end
  end
end
```

Then to visit the page, just call:

* either the `visit_path` instance method ;
* or the `visit` class method ;

There is several variants of the visit method:

* without parameter (#1);
* with a string parameter which will be appended at the end (#2);
* with an integer parameter which will be appended at the end (#3);
* with a hash parameter:
    * if the path has no segment, the key/value pairs will be appended as query strings (#4);
    * if the path has a segment, the hash must at least contains all the segment IDs, which will be interpolated. The other keys will be appended as query strings (#5);

<table>
    <tr>
        <th>#</th>
        <th>path method</th>
        <th>method parameters</th>
        <th>resulting path</th>
    </tr>
    <tr>
        <td>1</td>
        <td>products</td>
        <td>[none]</td>
        <td>/products</td>
    </tr
    <tr>
        <td>2</td>
        <td>products</td>
        <td>'some_string'</td>
        <td>/products/some_string</td>
    </tr>
    <tr>
        <td>3</td>
        <td>products</td>
        <td>1</td>
        <td>/products/1</td>
    </tr>
    <tr>
        <td>4</td>
        <td>products</td>
        <td>{ 'k1'=>'v1', 'k2'=>'v2' }</td>
        <td>/products?k1=v1&k2=v2</td>
    </tr>
    <tr>
        <td>5</td>
        <td>products/:id1/parts/:id2</td>
        <td>{ :id1=>'v1', :id2=>'v2', 'k3'=>'v3' }</td>
        <td>/products/v1/parts/v2?k3=v3</td>
    </tr>
</table>

### CapybaraPageObject::Component ###

CapybaraPageObject::Component represents a part of a page (e.g. a sidebar).

### CapybaraPageObject::Element ###

CapybaraPageObject::Element represents a single element (e.g. a <footer> tag).

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
