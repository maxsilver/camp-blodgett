class Cabin < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
