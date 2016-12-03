module GigHelper

  def user_done_bidding_on_gig
    @gig = Gig.find(params[:id])
    @gig.proposals.where(user_id: current_user).count == 1
  end

  def user_is_gig_owner
    @gig = Gig.find(params[:id])
    @gig.user == current_user
  end
end