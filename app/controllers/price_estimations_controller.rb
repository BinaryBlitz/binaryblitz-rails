class PriceEstimationsController < ApplicationController
  def new
    @price_estimation = PriceEstimation.new
  end

  def create
    @price_estimation = PriceEstimation.new(price_estimation_params)

    if @price_estimation.save || @price_estimation.attributes.values.all?(&:blank?)
      redirect_to calculator_path, notice: 'Спасибо за вашу заявку, в ближайшее время мы свяжемся с вами.'
    else
      render :new
    end
  end

  private

  def price_estimation_params
    params
      .require(:price_estimation)
      .permit(
        :name, :phone_number, :comment, :communication_method,
        :camera_use, :logo, :geolocation_use, :specification_stage,
        platforms: [], registration_methods: [], notification_methods: []
      )
  end
end
