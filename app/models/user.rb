# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  name            :string(255)
#  avatar          :text
#

class User < ActiveRecord::Base
	has_secure_password
	has_many :tweets
	validates :email, uniqueness: true
end
