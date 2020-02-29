# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
  has_many :likes
end
