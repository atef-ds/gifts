class SendInvitationService
    attr_reader :event_gift

    def initialize(params)
      @event_gift = params[:event_gift]
    end

    def send_invitation
      participant_ids = @event_gift.participants.map(&:id)
      participants = participant_ids.product(participant_ids).reject {|item| item.first == item.second}
      list =  create_invitation participants
      list.each do |sender_recipient|
        ::InviteMailer.invite_email(@event_gift.id, sender_recipient.first, sender_recipient.second).deliver_later
      end
    end

    def create_invitation participants, list = []
      return [] unless participants.any?
      random_selection = participants.sample
      list << random_selection unless list_contains?(random_selection, list)
      if list.length == @event_gift.participants.count
        return list
      else
        create_invitation participants, list
      end
    end
    
    def list_contains?(random_selection, list)
      list.select {|item| item == random_selection }.any?
    end
end