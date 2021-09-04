class Movie < ApplicationRecord
  has_many :watch_progresses, dependent: :destroy

  def watch_progressed_by?(user)
    watch_progresses.any? { |watch_progress| watch_progress.user_id == user.id }
  end

  with_options presence: true do
    validates :genre
    validates :title
    validates :url
  end

  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5
  }

  def self.genre_list(genre)
    genre == "php" ? %w[php] : %w[basic git ruby rails]
  end
end
