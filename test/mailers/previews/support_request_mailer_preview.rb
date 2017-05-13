# Preview all emails at http://localhost:3000/rails/mailers/support_request_mailer
class SupportRequestMailerPreview < ActionMailer::Preview
   def new_support_request
     SupportRequestMailer.new_support_request(SupportRequest.first)
   end
end
