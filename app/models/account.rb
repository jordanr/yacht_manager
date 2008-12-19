require 'crypto'
require 'digest/sha1'
require 'base'
require 'yacht_transfer/transferers/yacht_world_transferer'
require 'yacht_transfer/transferers/yacht_council_transferer'
class Account < ActiveRecord::Base
  belongs_to :multiple_listing_system
  belongs_to :user
  has_many :uploads, :dependent=>:destroy
  # Virtual attribute for the unencrypted password
  attr_accessor :password
  validates_presence_of     :login
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
#  validates_uniqueness_of   :login, :case_sensitive => false
  before_save :encrypt_password
#  after_save :will_logon?
  
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :password, :password_confirmation

  def session(site = multiple_listing_system.name, username = login, password = decrypt_password)
    case (site)
      when "Yacht World": YachtTransfer::Transferers::YachtWorldTransferer.new(username, password)
      when "Yacht Council": YachtTransfer::Transferers::YachtCouncilTransferer.new(username, password)
      else nil
    end
  end

  def transfer
    print "Checking account #{to_s}..."
    ids = uploads.transfer_all(session)
    puts "done"
    ids
  end

  def self.transfer_all
    all.collect { |a| { a.id => a.transfer } }
  end

  def to_s
    login+"@"+multiple_listing_system.name
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Crypto.encrypt(password, salt)
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  # Decrypts some data with the salt.
  def self.decrypt(password, salt)
    Crypto.decrypt(password, salt)
  end

  # Decrypts the password with the user salt
  def decrypt(password)
    self.class.decrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

    def decrypt_password
      return if crypted_password.blank?
      decrypt(crypted_password)
    end
      
    def will_logon?
      begin
        session.login
      rescue
        errors.add_to_base("Bad login and/or password.")
        raise ActiveRecord::Rollback, "Call tech support!"
	false
      end
    end

  protected

    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--") if new_record?
      self.crypted_password = encrypt(password)
    end

    def password_required?
      crypted_password.blank? || !password.blank?
    end

end
