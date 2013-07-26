class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true
  validates :password_hash , :presence => true
  validates :email, :presence => true
  validate  :email_valid?
  before_create :create_image_url

  has_many :posts
  has_many :comments

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = self.find_by_username(username)
    if user && user.password == password
     user
    else
      nil
    end
  end

  def email_valid?
    if email.present? && email !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
      errors.add(:email, "Email is invalid")
    end
  end
  
  private 
  def create_image_url
    url = Gravatar.new(self.email).image_url
    self.img_url = url 
  end
end