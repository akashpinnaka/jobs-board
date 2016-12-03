class ProposalsController < ApplicationController

  before_action :set_gig, only: [:new, :create]
  before_action :authenticate_user!, only: [:create]
  before_action :avoid_proposing_on_own_gig, only: [:create]
  before_action :avoid_more_than_one_proposal_on_a_gig, only: [:create]

  def show
    @proposal = Proposal.find(params[:id])
  end

  def create    
    @proposal = @gig.proposals.new proposal_params
    @proposal.user = current_user
    if @proposal.save
      redirect_to gig_path(@proposal.gig), notice: 'Proposal sent successfully.'
    else
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:bid, :description)
  end

  def set_gig
    @gig = Gig.find(params[:gig_id])
  end

  def avoid_proposing_on_own_gig
    if current_user == @gig.user
      redirect_to @gig, notice: 'you cannot bid on your own Job.'
    end
  end

  def avoid_more_than_one_proposal_on_a_gig
    if @gig.proposals.where(user_id: current_user).count >= 1
      redirect_to @gig, notice: 'You cannot bid more than once on same Job'
    end
  end

end