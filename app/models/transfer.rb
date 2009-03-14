class Transfer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :account
end
