class LikesController < ApplicationController
    before_action :require_signin



    # def new 
    #     @event = Event.find(params[:event_id])
    # end

    def create
       
       @event = Event.find_by!(slug: params[:event_id])
       @user = current_user
       @like = @event.likes.new(user: @user, event: @event)
       @like.save
       redirect_to @event
    end

    def destroy
      

        @event = Event.find_by!(slug: params[:event_id])
        @like = current_user.likes.find_by!(params[:id])
        @like.destroy!
        redirect_to @event
    end
 


end
