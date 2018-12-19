class EventGiftsController < ApplicationController
  before_action :set_event_gift, only: [:show, :edit, :update, :destroy, :send_invitations]

  # GET /event_gifts
  # GET /event_gifts.json
  def index
    @event_gifts = EventGift.all
  end

  # GET /event_gifts/1
  # GET /event_gifts/1.json
  def show
  end

  # GET /event_gifts/new
  def new
    @event_gift = EventGift.new
  end

  # POST /event_gifts
  # POST /event_gifts.json
  def create
    @event_gift_result = CreateEventGift.call(params: event_gift_params)
    @event_gift = @event_gift_result.event_gift
    respond_to do |format|
      if @event_gift_result.success?
        format.html { redirect_to @event_gift_result.event_gift, notice: 'Event gift was successfully created.' }
        format.json { render :show, status: :created, location: @event_gift_result.event_gift }
      else
        format.html { render :new }
        format.json { render json: @event_gift_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_gifts/1
  # DELETE /event_gifts/1.json
  def destroy
    @event_gift.destroy
    respond_to do |format|
      format.html { redirect_to event_gifts_url, notice: 'Event gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_gift
      @event_gift = EventGift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_gift_params
      params.require(:event_gift).permit(:title, :price, participants_attributes: [:id, :name, :email, :_destroy])
    end
end
