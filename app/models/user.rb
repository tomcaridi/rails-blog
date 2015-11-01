class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	validates_uniqueness_of :username
	validates_presence_of :username, :password
end
