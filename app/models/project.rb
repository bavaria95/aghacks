class Project < ActiveRecord::Base
	has_many :users
  has_and_belongs_to_many :skills
  accepts_nested_attributes_for :skills
end
