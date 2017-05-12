class CallbackRequestsController < ApplicationController
  def create
    @callback_request = CallbackRequest.new(callback_request_params)

    if @callback_request.save
      redirect_to root_path
    else
      render template: 'pages/home'
    end
  end

  private

  def callback_request_params
    params.require(:callback_request).permit(:name, :phone_number)
  end
end
