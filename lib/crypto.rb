require 'openssl'
require 'digest/sha2'
 
module Crypto
  def self.encrypt(plain_text, key)
    crypto = start(:encrypt, key)
 
    cipher_text = crypto.update(plain_text)
    cipher_text << crypto.final
 
    cipher_hex = cipher_text.unpack("H*").join
 
    return cipher_hex
  end
 
  def self.decrypt(cipher_hex, key)
    crypto = start(:decrypt, key)
 
    cipher_text = cipher_hex.gsub(/(..)/){|h| h.hex.chr}
 
    plain_text = crypto.update(cipher_text)
    plain_text << crypto.final
 
    return plain_text
  end
 
  private
 
  def self.start(mode, key)
    crypto = OpenSSL::Cipher::Cipher.new('aes-256-ecb').send(mode)
    crypto.key = Digest::SHA256.hexdigest(key)
    return crypto
  end
end
