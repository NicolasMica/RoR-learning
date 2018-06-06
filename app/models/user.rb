class User < ApplicationRecord

	validates :firstname, :lastname, :email, :birthdate, :phone, presence: true
	validates :email, uniqueness: true

	has_many :photos, inverse_of: :user, counter_cache: true, dependent: :destroy
	accepts_nested_attributes_for :photos

	def fullname
		"#{firstname.titlecase} #{lastname.titlecase}"
	end

end
