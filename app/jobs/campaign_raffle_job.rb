class CampaignRaffleJob < ApplicationJob
  queue_as :emails

  def perform(campaign)
    results = RaffleService.new(campaign).call

    campaign.members.each {|m| m.set_pixel}
    
    results.ecah do |r|
      CampaignMailer.raffle(campaign, r.first, r.last).delivery_now
    end
    
    campaign.update(status: :finished)

    #TODO
=begin
    if results == false
      # Send mail to owner of campaign (desafio)
    end
=end
  end
end
