class GigsController < ApplicationController

  before_action :set_gig, only: [:show]

  def index
    @gigs = Gig.all.order('created_at DESC').page(params[:page]).per(20)
  end

  def show
    
  end

  def new
    @gig = current_user.gigs.new
  end

  def create
    @gig = current_user.gigs.new gig_params
    if @gig.save
      redirect_to gig_path(@gig), notice: 'Your job was posted successfully.'
    else
      render 'new', notice: 'Unable to post your job. Please check for errors.'
    end
  end

  def search
    @gigs = Gig.search(params[:search]).page(params[:page]).per(20)
    render 'index'
  end

  private

  def gig_params
    params.require(:gig).permit(:name, :description, :budget, :location, :open)
  end

  def set_gig
    @gig = Gig.find(params[:id])
  end

end