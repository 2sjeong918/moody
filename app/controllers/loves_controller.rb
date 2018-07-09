class LovesController < ApplicationController
    def create
        @love = Love.new(user_id: current_user.id, post_id: params[:post_id])
        @love.save
        redirect_to("/posts/#{params[:post_id]}")
    end
    
    def destroy
        @love = Love.find_by(user_id: current_user.id, post_id: params[:post_id])
        @love.destroy
        redirect_to("/posts/#{params[:post_id]}")
    end
end
