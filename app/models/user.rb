class User < ActiveRecord::Base
  has_many :posts
  has_many :audit_logs
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  validates :phone, presence: true
  validates :phone, length: {is: 10}
  PHONE_REGEX = /\A[0-9]*\z/
  validates :phone, format: {with: PHONE_REGEX}

  
  
  def full_name
  	"#{first_name} #{last_name}"
  end

  def admin?
    self.type == "AdminUser"
  end

end
