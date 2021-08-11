class WatchProgress < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id, uniqueness: {
    scope: :movie_id,
    message: "は同じ動画教材を2回以上視聴済みにはできません"
  }
end
