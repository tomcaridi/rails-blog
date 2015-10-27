class Post < ActiveRecord::Base
	scope :last_post, -> {
	  where('created_at between ? and ?', Time.now-1.day, Time.now)
	}
	belongs_to :user
	has_many :comments
end
