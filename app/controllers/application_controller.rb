class ApplicationController < ActionController::Base
    before_action :authorize
    before_action :set_i18n_locale_from_params

    protected

    def authorize
        unless User.find_by(id: session[:user_id])
            redirect_to login_url, notice: "Please log in"
        end
    end

    def set_i18n_locale_from_params
        if params[:locale]
            locale_param = params[:locale]
            if I18n.available_locales.map(&:to_s).include?(locale_param)
                I18n.locale = locale_param
            else
                flash.now[:notice] = "#{locale_param} translation not available"
                logger.error flash.now[:notice]
            end
        end
    end
end
