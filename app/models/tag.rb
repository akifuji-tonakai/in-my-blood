class Tag < ApplicationRecord
  has_many :urls, dependent: :destroy
  belongs_to :user,validate: false
end
