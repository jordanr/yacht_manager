require 'action_view/helpers/number_helper'

class Listing < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper

  has_many :details
  has_many :photos

  validates_numericality_of :price, :yacht_specification_length, :allow_nil=>true
  validates_inclusion_of :yacht_specification_year, :in => 1800..2100, :allow_nil=>true

  after_save :add_defaults

  def formated_price
    price.nil? ? "-" : "$#{number_with_delimiter(price)}"
  end

  def formated_length
    yacht_specification_length.nil? ? "-" : "#{yacht_specification_length}\'"
  end

  private
    def add_defaults
      update_attribute(:broker_id, 1) if broker_id.nil?
      update_attribute(:yacht_name, "No name") if yacht_name.nil? or yacht_name.empty?
      update_attribute(:yacht_specification_manufacturer, "Custom") if yacht_specification_manufacturer.nil? or yacht_specification_manufacturer.empty?
    end
end
