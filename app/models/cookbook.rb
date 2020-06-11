class Cookbook < ApplicationRecord
  belongs_to :user
  has_many :cookbook_inclusions
  has_many :recipes, through: :cookbook_inclusions
end
