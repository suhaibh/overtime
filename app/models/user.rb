class User < ActiveRecord::Base
  has_many :posts
  has_many :audit_logs

  has_many :hands_associations, class_name: "Hand"
  has_many :hands, through: :hands_associations
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :phone, :company, :ssn
  
  validates :ssn, length: {is: 4}
  validates_numericality_of :ssn, { only_integer: true }
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
