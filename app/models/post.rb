class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validates :is_clickbait

  def :is_clickbait
    clickbait_words = ["Won't Believe", "Secret", "Top
[number]", "Guess"]
    if !clickbait_words.include?(self.summary)
      return false
    end
  end
end
