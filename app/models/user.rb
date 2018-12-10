class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
            :uniqueness => { case_sensitive: false }
  validates :password, presence: true,
            length: { minimum: 4 }

  def self.authenticate_with_credentials(email, password)
    match = nil
    email = email.strip.downcase
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      match = true
    else
      match
    end
  end
end
