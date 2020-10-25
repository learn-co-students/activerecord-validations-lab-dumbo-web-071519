class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

    validate :is_clickbait

    def is_clickbait
        clickbait_words = ["Won't Believe", "Secret", "Top ", "Guess"]
        clickbait = false
        
        clickbait_words.each do |word|
            #binding.pry
            if self.title && self.title.include?(word)
                clickbait = true
            end
        end

        if !clickbait 
            self.errors.add(:title, "must be clickbaity.")
        end

    end
end
