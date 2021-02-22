class Tag < ApplicationRecord
  has_many :urls
  belongs_to :user,validate: false
end
