class GirlFriend < ApplicationRecord

	validates :first_name, 	:presence => true
	validates :last_name, 	:presence => true
	validates :email, 			:presence => true

	validates :email, 			:uniqueness => true

	validates :first_name, uniqueness: { scope: :last_name, message: "Girl Friend Exists" }

	# before_save :reverse_email

	# after_initialize :reverse_email

	belongs_to :boy


	def full_name
		"#{first_name} #{last_name}"
	end

	def gravatar
		"http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
	end

	private

	def reverse_email
		self.email = self.email.reverse unless self.email.blank?
	end

end
