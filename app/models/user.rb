class User < ActiveRecord::Base
  
  has_secure_password
  
  validates :email, uniqueness: true
  validates :password, :length => { minimum: 6}

  def self.authenticate_with_credentials email, password
    user_email = email.strip.downcase;
    user = User.find_by_email(user_email)

    # If the user exists AND the password entered is correct.
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
