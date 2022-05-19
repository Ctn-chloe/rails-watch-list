class Movie < ApplicationRecord
  has_many :bookmarks
  before_destroy :check_for_bookmarks

  validates :title, uniqueness: true
  validates :overview, presence: true
  validates :title, length: { minimum: 1 }

  private

  def check_for_bookmarks
    bookmarks.count.positive? ? false : true
  end
end
