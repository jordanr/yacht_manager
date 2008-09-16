class Upload < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  belongs_to :account

end
