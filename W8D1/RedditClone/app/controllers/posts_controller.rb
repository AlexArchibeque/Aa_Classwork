class PostsController < ApplicationController
    def new
        @post = Post.new(post_params)
        render :new
    end
    
    def show
        
    end
    
    def create
        @post = Post.new(post_params)
        @post.author_id = current_user.id
        if @post.save
            redirect_to post_url(@post)
        else

        end
    end
    
    def edit
        @post = Post.find(params[:id])

        if is_author?(@post)
            render :edit
        else
            flash[:errors] = ["Only post authors can edit posts."]
            redirect_to sub_url(@post.sub)
        end
    end

    def update
        @post = Post.find(params[:id])
        if is_author?(@post)            
            if @post.update(post_params)
                redirect_to post_url(@post)
            else
                flash.now[:errors] = @post.errors.full_messages
                render :edit
            end
        else 
            flash[:errors] = ["Only post authors can edit posts."]
            redirect_to sub_url(@post.sub)
        end
    end

    def destroy

    end

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id)
    end
end
