class CampaignMailer < ApplicationMailer
  def raffle(campaign, member, friend)
     @campaign = campaign
     @member = member
     @friend = friend
     mail to: @member.email, subject: "Secret friend: #{@campaign.title}"   
  end  
end
