class CreateEventGift
  include Interactor
  attr_reader :event_gift
  def call
    create_event_gift
    send_invitations
  end

  def create_event_gift
    @event_gift = EventGift.new(context.params)
    if @event_gift.save
      context.event_gift = @event_gift
    else
      context.fail!(errors: @event_gift.errors, event_gift: @event_gift)
    end
  end

  def send_invitations
    SendInvitationService.new({event_gift: @event_gift}).send_invitation
  end
  
end