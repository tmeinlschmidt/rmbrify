class Note < ActiveRecord::Base
	belongs_to :user

	validates :content, presence: true, length: {
		minimum: 1,
		maximum: 255
	}
end
