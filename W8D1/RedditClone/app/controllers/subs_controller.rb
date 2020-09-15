class SubsController < ApplicationController
    before_action :require_logged_in?, except: [:show, :index]

    def new
        render :new
    end
    def show
        @sub = Sub.find(params[:id])
        render :show
    end
    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        if is_moderator?(@sub)
            render :edit
        else
            flash[:errors] = ["You do not have permission to edit this sub!"]
            redirect_to subs_url
        end
    end

    def update
        @sub = Sub.find(params[:id])
        if is_moderator?(@sub)            
            if @sub.update(sub_params)
                redirect_to sub_url(@sub)
            else
                flash.now[:errors] = @sub.errors.full_messages
                render :edit
            end
        else 
            flash[:errors] = ["You do not have permission to edit this sub!"]
            redirect_to subs_url
        end
    end
    def index
        @subs = Sub.all
        render :index
    end
    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
