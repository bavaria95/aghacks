class Project < ActiveRecord::Base
	has_many :users
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills
  has_one :apply

  def applied?
    applied_at != nil
  end

  def apply
    @apply = Apply.create
    self.update_attributes(apply_id: @apply_id)
  end

  def unapply
    self.apply.destroy
  end

end
