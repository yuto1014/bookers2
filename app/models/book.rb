class Book < ApplicationRecord

	belongs_to :user
	has_many :post_comments, dependent: :destroy

	validates :title, presence: true, length: { in: 1..200 }
	validates :body, presence: true, length: { in: 1..200 }
end
