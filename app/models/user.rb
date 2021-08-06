class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :set_password

  validates_presence_of :name

  # User.distinct.pluck(:type)
  ['Employer', 'Candidate'].each do |role_name|
    define_method("#{role_name.downcase}?") do
      return type == role_name
    end
  end

  private
  def set_password
    if self.password.blank?
      self.password = self.password_confirmation = 'password'
    end
  end
end
