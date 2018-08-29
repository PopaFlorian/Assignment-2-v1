class Product < ApplicationRecord
    has_one_attached :avatar

    scope :filtered, ->(filter_param) {where(:description => filter_param)}
    scope :vegetarian, ->() {where(:vegetarian => "true")}
    scope :filter_price, ->(slide1,slide2) {where("price>? AND price<?",slide1,slide2)}
end
