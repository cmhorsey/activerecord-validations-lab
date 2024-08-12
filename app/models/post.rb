class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :title_is_clickbait

  def title_is_clickbait
    unless title&.match?(/Won't Believe|Secret|Top \d+|Guess/i)
      errors.add(:title, "needs more clickbait")
    end
  end
end
