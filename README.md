# Chocolate Store with Ruby on Rails Framework

## Description

I. Shhopping Cart
1. Include models:
- Product: name, price, description, image.
- Category: name
- Cart
- LineItem: quantity
- User: username, email, password
2. Set up association between models:
- Product:
` belongs_to :category
  has_many :line_items, dependent: :destroy
  belongs_to :user, optional: true`

- Category:
` has_many :products`

- Cart:
` has_many :line_items, dependent: :destroy`

- LineItem:
` belongs_to :product
  belongs_to :cart`

- User:
` has_many :products`

II. Use Elasticsearch to search product

1. Install Elasticsearch on MacOS
- Install JDK:
`
brew tap caskroom/versions
brew cask install java8`

- Install elasticsearch:
`brew install elasticsearch`

2. Run elasticsearch
- Use command:
`elasticsearch`
-  Navigate to http://127.0.0.1:9200/ on browser to see a json response like the one below:
`
{
  "name" : "mB8WtfU",
  "cluster_name" : "elasticsearch_letavi",
  "cluster_uuid" : "xKy9ZxAtSTOXBuEmq1Nbqg",
  "version" : {
    "number" : "6.6.1",
    "build_flavor" : "oss",
    "build_type" : "tar",
    "build_hash" : "1fd8f69",
    "build_date" : "2019-02-13T17:10:04.160291Z",
    "build_snapshot" : false,
    "lucene_version" : "7.6.0",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}`

3. Integrating Elasticsearch
- In Gemfile, add bellow gems:
`
gem 'elasticsearch-model'
gem 'elasticsearch-rails'`

- Run `bundle install` to install gems
- Add  `SearchController` with action `search`
- In search action define:
`
@roducts = params[:q].nil? ? [] : Product.search(params[:q])
`

Check if there is a query params if there isn't then show all products else show products that contains the query params.

- Integrating search into product:
To add the ElasticSearch integration to the Product model, require elasticsearch/model and include the main module in Product class.

Modify app/models/product.rb to have the following content:
`
require 'elasticsearch/model'
class Product < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Product.import`

Notes: If errors, change `Product.import` to `Product.import(force: true)`

In the code snippet above Product.import auto sync model with elastic search.


- Create a new file at app/views/search/search.html.erb
- Add a search route:
Add the search route to config/routes.rb with the content:
`get 'search', to: 'search#search'`
