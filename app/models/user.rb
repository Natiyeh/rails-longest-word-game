class User < ApplicationRecord
  attr_reader :password

  validates :email, :encrypted_password, presence: true
  validates :password, length:{minimum: 6, allow_nil: true}

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.encrypted_password = BCrypt::Password.create(unencrypted_password)
    end
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.encrypted_password).is_password?(unencrypted_password)
  end
end
