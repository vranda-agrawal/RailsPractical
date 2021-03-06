class EventsController < ApplicationController
  before_action :require_user, only: [:index, :show]

  def index
    @events=Event.all.order("date DESC")
  end

  def new
    @event=Event.new
  end
  
  def create
    puts params
    @event=Event.create(event_params)
    if @event.valid?
      redirect_to events_path
    else 
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def user_enrol
    user=session[:user_id]
    event_id=params[:id]
    enrolled=Enrol.create(event_id: event_id,user_id: user )
    if enrolled.valid?
      redirect_to events_path
    else
      puts "Cound not enroll in "
    end
  end

  def edit
    @event= Event.find(params['id'])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.valid?
      redirect_to events_path
    else 
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def show
    @event= Event.find(params['id'])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def add_comment
    user=session[:user_id]
    comment=params[:comment]
    event_id=params[:event_id]
    comment_obj=Comment.create(user_id: user,event_id: event_id,comment: comment)
    if comment_obj.valid?
      redirect_to "/events/"+event_id
    else
      redirect_to "/"
    end
  end

  def filter
    if params[:q].blank?
      flash[:errors]=""
      return
    else
      category_id=params[:q][:category_id]
      @events=Event.where(category_id: category_id)
      if @events.blank?
        flash.now[:alert] = "Data not found"
      end  
    end
  end

  private
  def event_params
    params.require(:event).permit(:user_id,:name,:description,:date,:category_id)
  end
end
