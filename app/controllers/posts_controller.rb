class PostsController < ApplicationController
    def new 
        @post = Post.new 
    end

    def create 
        @post = Post.create(title: [params][:post][:title],
        destination: [params][:post][:destination],
        content: [params][:post][:content], 
        author_id: [params][:post][:author_id],
        destination_id: [params][:post][:destination_id])

        redirect_to @post
    end

    def show 
        @post = Post.find(params[:id])
        if params[:liked] == true 
            @post.likes +=1
            @post.save 
        end
        @post_author = Blogger.find(@post.blogger_id)
        @post_destination = Destination.find(@post.destination_id)
    end

    def edit 
        @post = Post.find(params[:id])
    end

    def update 
        #rip
    end
end
