class TimelineController < ApplicationController
    before_action :authenticate_user!, except: :index
    def index
        @blogs = Blog.all.reverse
        @myblogs = Blog.where(user_id: current_user.id)
    end
    
    def write
        Blog.create(user_id: current_user.id, content: params[:naeyong])
        redirect_to :root
    end
    
    def comment
        Comment.create(user_id: current_user.id, blog_id: params[:blog_id], msg: params[:comment])
        redirect_to :root
    end
    
    def destroy
        pp = Comment.find(params[:id])
        pp.destroy
        redirect_to :root
    end
    
    def edit
        @post = Comment.find(params[:id])
        
    end
    
    def update
        pp = Comment.find(params[:id])
        pp.user_id = params[:name]
        pp.msg = params[:content]
        pp.save
        redirect_to :root
    end
end
