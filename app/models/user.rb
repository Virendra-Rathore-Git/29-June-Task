	class User < ApplicationRecord

		enum :status,[:activated,:inactivated]

		validates :name,:password,:status ,presence:true
		validates :email,uniqueness:true
	end