class Photo < ApplicationRecord

	validates :name, :file, :user_id, presence: true

	belongs_to :user

end
