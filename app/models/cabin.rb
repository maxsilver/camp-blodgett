class Cabin < ActiveRecord::Base
  validates :name, presence: true
end
