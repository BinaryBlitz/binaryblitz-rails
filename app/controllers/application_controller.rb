class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  protected

  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  # Extract locale from top-level domain:
  # binaryblitz.ru => :ru, binaryblitz.xyz => :en, else return nil
  def extract_locale_from_tld
    tld = request.host.split('.').last

    case tld
    when 'ru' then :ru
    when 'xyz' then :en
    end
  end
end
