class Transfer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :account

  before_create :do_transfer
  before_update :do_transfer
  before_destroy :do_untransfer

  def do_untransfer
    session = account.transferer(account.login, account.decrypt_password)
    errors.add_to_base("Could not find transferer for #{listing.to_s} to #{account.to_s}") and return false if ! session

    begin
      self.remote_id = session.destroy(self.remote_id)
    rescue Exception => e
      errors.add_to_base("Exception #{e} while removing #{listing.to_s} from #{account.to_s}") and return false
    end

    errors.add_to_base("Failed to remove #{listing.to_s} from #{account.to_s}") and return false if self.remote_id
  end

  def do_transfer
    session = account.transferer(account.login, account.decrypt_password)
    errors.add_to_base("Could not find transferer for #{listing.to_s} to #{account.to_s}") and return false if ! session

    begin
      if self.remote_id
        new_id = session.update(listing.to_yt, self.remote_id)
	raise Exception, "ids do not match" unless self.remote_id = new_id
      else
        self.remote_id = session.create(listing.to_yt)
      end
    rescue Exception => e
      errors.add_to_base("Exception #{e} while transfering #{listing.to_s} to #{account.to_s}") and return false
    end

    if ! self.remote_id
      errors.add_to_base("Failed to transfer #{listing.to_s} to #{account.to_s}") and return false
    else
      self.remote_id
    end
  end
  
end
