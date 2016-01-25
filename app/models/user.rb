class User < ActiveRecord::Base

  has_secure_password

  # do we need the authenticate method?

  def authenticate(username, password)
    self.password == password && self.username == username
  end

end