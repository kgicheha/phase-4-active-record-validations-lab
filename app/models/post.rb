class Post < ApplicationRecord
    validates :title, presence: true
    validates_length_of :content, :minimum => 250
    validates_length_of :summary, :maximum => 250
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :clickbait?


    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pattern| pattern.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end