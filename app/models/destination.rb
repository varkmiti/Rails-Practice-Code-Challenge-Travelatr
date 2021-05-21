class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts 


    def most_recent_posts
        self.posts.last(5)
    end

    def avg_age
    avg = self.bloggers.map do |blogger|
             blogger.age  
            end.uniq
    avg.sum/avg.count 
    end 

    def featured_post
        post = self.posts.max_by { |post| post.likes }
    
   end

end


