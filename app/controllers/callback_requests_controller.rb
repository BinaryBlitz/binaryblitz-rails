class CallbackRequestsController < ApplicationController
  def new
    @callback_request = CallbackRequest.new
  end

  def create
    @callback_request = CallbackRequest.new(callback_request_params)

    if @callback_request.save || @callback_request.attributes.values.all?(&:blank?)
      redirect_to root_path, notice: 'Спасибо за вашу заявку, в ближайшее время мы свяжемся с вами.'
    else
      render :new
    end
  end

  private

  def callback_request_params
    params.require(:callback_request).permit(:name, :phone_number, :email, :content)
  end
end
