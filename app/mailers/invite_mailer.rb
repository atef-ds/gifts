class InviteMailer < ApplicationMailer
    layout 'mailer'

    def invite_email(event_gift_id, sender_id, recipient_id)
      @event_gift = EventGift.find(event_gift_id)  
      @sender = User.where(id: sender_id).first
      @recipient =  User.where(id: recipient_id).first
      
      mail(
        to: @sender.email,
        subject: 'Votre Secret Santa'
      )
    end
end
