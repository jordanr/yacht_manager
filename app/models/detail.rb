require 'will_paginate'
class Detail < ActiveRecord::Base
  belongs_to :listing

  after_create :add_order

  private
    def add_order
      update_attribute(:order, id)
    end
end
