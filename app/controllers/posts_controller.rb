class PostsController < ApplicationController
  
   def new
       @post = Post.now
   end
   
  
   def create
       @post = Post.new(post_params)
       @post.user_id = current_user.id
       respond_to do |f|
           if (@post.save)
               f.html {redirect_to "" , notice:"Post created"}
           else
               f.html {redirect_to "", notice: "Error: Post not saved!" }
           end
       end
   end
       
       private
         #allows certain data to be passed via form
       def post_params
      params.require(:post).permit(:user_id, :content)
    end
end