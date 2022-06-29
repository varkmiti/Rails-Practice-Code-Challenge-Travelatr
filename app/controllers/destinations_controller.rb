class DestinationsController < ApplicationController
    def show 
        @destination = Destination.find(params[:id])
        @most_recent_posts = @destination.posts.filter {|o| o[:created_at] < Date.today}.first(5)
        @featured_post= @destination.posts.max_by {|o| o[:likes]}
        @average_likes = (@destination.posts.map { |p| p.likes}.sum) / @destination.posts.count 
    end
end
