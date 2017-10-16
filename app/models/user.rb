require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :book_users
  has_many :books, through: :book_users
 
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @plain_text_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password_to_check)
    if self.password == password_to_check
      true
    end
  end

end
