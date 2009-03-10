require 'will_paginate'
class Detail < ActiveRecord::Base
  belongs_to :listing
end
