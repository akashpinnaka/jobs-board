class GigsController < ApplicationController

  before_action :set_gig, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @gigs = Gig.all.order_list(params[:sort_by]).page(params[:page]).per(20)
    @applicants_count = 0
    User.all.each do |user|
      if user.proposals.count > 0
        @applicants_count += 1
      end
    end
  end

  def show
    @proposals = @gig.proposals.order('created_at DESC')
    @proposal = @gig.proposals.where(user_id: current_user.id).first
    @awarded_proposal = Proposal.find(@gig.awarded_proposal) if @gig.awarded_proposal
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

  def edit
    
  end

  def update
    @gig.update gig_params
    redirect_to @gig
  end

  def destroy
    @gig.destroy
    redirect_to mygigs_path
  end

  def search
    if params[:category].blank? && params[:search].blank?
      @gigs = Gig.all.order(created_at: :asc).page(params[:page]).per(20)
    else
      @gigs = Gig.search(params).page(params[:page]).per(20)
    end
    render 'index'
  end

  def mygigs
    @mygigs = current_user.gigs
  end

  private

  def gig_params
    params.require(:gig).permit(:name, :description, :budget, :location, :open, :awarded_proposal, :category_id, :skill_list)
  end

  def set_gig
    @gig = Gig.find(params[:id])
  end

  def require_same_user
    if current_user != @gig.user
      redirect_to @gig, notice: 'You cannot access others data'
    end
  end

end