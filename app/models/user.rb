class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_paper_trail

  def admin?
    self.has_role? :admin
  end

  def customer?
    self.has_role? :customer
  end

  def manager?
    self.has_role? :manager
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def under_age?
    TimeDifference.between(DateTime.now.utc, birth_date).in_years <= 18
  end
end
