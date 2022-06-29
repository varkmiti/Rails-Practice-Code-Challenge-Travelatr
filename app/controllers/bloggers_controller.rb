class BloggersController < ApplicationController
    def show 
        @blogger = Blogger.find(params[:id])
        @blogger_total_likes = @blogger.posts.map {|post| post.likes }.sum
        if @blogger.posts == []
            @most_liked_post = "No fans yet :("
        else 
            @most_liked_post = @blogger.posts.max {|p1, p2| p1.likes <=> p2.likes}.title
        end
    end
    
    def new 
        @blogger = Blogger.new
    end

    def create 
        @blogger = Blogger.create(name: params[:blogger][:name], 
        bio: params[:blogger][:bio], age: params[:blogger][:age])
        
        if @blogger.save 
            redirect_to @blogger
        else 
            redict_to "/bloggers/new"
        end 
        
    end


private 
    def blogger_params 
        params.require(:name).permit(:age, :bio)
    end 

end
