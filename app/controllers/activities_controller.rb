class ActivitiesController < ApplicationController
  def index
    @activities = Activity.order("created_at DESC")
  end



  private
  def activity_params
    params.require(:activity).permit(:action, :trackable)
  end
end
