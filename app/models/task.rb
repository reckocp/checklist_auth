class Task < ActiveRecord::Base
  validates :completed, inclusion: [true, false]
  validates :body, presence: true
  validates :position, presence: true
  validates_uniqueness_of :position
end
