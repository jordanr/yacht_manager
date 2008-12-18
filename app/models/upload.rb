class Upload < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing
  belongs_to :account

  #    find_by_sql(["SELECT * FROM Uploads WHERE dirty=?", true])
  def self.transfer_all(session)
    find(:all, :conditions => ["dirty = ?", true]).collect { |u| u.transfer(session) }
  end

  def transfer(session)
    print "#{id}..."
    if(remote_id)
      session.update(listing.to_yt, remote_id)
    else
      update_attribute(remote_id, session.create(listing.to_yt))
    end
    id
  end
end
