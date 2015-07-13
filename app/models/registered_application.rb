class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  
  validates :name, uniqueness: true
  validates :url, uniqueness: true
end
