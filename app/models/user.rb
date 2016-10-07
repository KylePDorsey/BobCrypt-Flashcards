class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds

  validates :email, :presence => true, :uniqueness => true
  validates :password_hash, :presence => true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user_to_authenticate = User.find_by(email: email)
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end

end
