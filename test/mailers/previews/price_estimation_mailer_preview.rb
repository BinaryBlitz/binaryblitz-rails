# Preview all emails at http://localhost:3000/rails/mailers/price_estimation_mailer
class PriceEstimationMailerPreview < ActionMailer::Preview
    def new_price_estimation
     PriceEstimationMailer.new_price_estimation(PriceEstimation.first)
   end
end
