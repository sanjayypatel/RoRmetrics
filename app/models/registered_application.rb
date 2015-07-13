class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events
  validates :name, uniqueness: true
  validates :url, uniqueness: true
end
