class Boy < ApplicationRecord

	validates :first_name, 	:presence => true
	validates :last_name, 	:presence => true
	validates :email, 			:presence => true

	validates :email, 			:uniqueness => true

	validates :first_name, uniqueness: { scope: :last_name, message: "Boy Exists" }

	# before_save :reverse_email

	# after_initialize :reverse_email

	has_many :girl_friends, :dependent => :destroy

	#scope :all_boys, -> select("*")

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
