require 'crypto'
require 'digest/sha1'
class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transfers

  # Virtual attribute for the unencrypted password
  attr_accessor :password

  validates_presence_of     :login
  validates_presence_of     :password,                   :if => :password_required?
  validates_presence_of     :password_confirmation,      :if => :password_required?
  validates_length_of       :password, :within => 4..40, :if => :password_required?
  validates_confirmation_of :password,                   :if => :password_required?
  validates_length_of       :login,    :within => 3..40
  before_save :encrypt_password
 
  validate :yt_account, :if => :password_required?
  validates_mls

  def yt_account
    errors.add_to_base("Couldn't login to #{mls}: Invalid username|password combination") unless account_authenticity(login, password)
  end

  def to_s; "#{login}@#{mls}"; end

  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :password, :password_confirmation, :mls_id

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

  def decrypt_password
    return if crypted_password.blank?
    decrypt(crypted_password)
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
