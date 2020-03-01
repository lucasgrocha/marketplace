module UserMethods
  def admin?
    self.has_role? :admin
  end

  def customer?
    self.has_role? :customer
  end

  def manager?
    self.has_role? :manager
  end

  def any_role?
    admin? || customer? || manager?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def under_age?
    TimeDifference.between(DateTime.now.utc, birth_date).in_years <= 18
  end
end