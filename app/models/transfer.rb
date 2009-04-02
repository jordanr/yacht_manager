class Transfer < ActiveRecord::Base
  belongs_to :listing
  belongs_to :account

  validate :do_transfer

  def do_transfer
    session = account.transferer(account.login, account.decrypt_password)

    errors.add_to_base("Could not find transferer for #{listing.to_s} to #{account.to_s}") and return if ! session

    begin
      print listing.to_yt.inspect
      if self.remote_id
        new_id = session.update(listing.to_yt, self.remote_id)
	raise Exception, "ids do not match" unless self.remote_id = new_id
      else
        self.remote_id = session.create(listing.to_yt)
      end
    rescue Exception => e
      errors.add_to_base("Exception #{e} while transfering #{listing.to_s} to #{account.to_s}") and return
    end

    if ! self.remote_id
      errors.add_to_base("Failed to transfer #{listing.to_s} to #{account.to_s}") and return
    else
      self.remote_id
    end
  end
  
end
