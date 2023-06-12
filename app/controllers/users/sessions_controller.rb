# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController

  prepend_before_action :recaptcha_login, only: [:create] # Change this to be any actions you want to protect.


  private


  def recaptcha_login
    return if check_captcha?
    self.resource = resource_class.new(sign_in_params)
    set_minimum_password_length
    respond_with_navigational(resource) do
      flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
      render :new
    end
  end

  def check_captcha?
    success = verify_recaptcha(action: 'login', minimum_score: 0.75, secret_key: ENV['RECAPTCHA_SECRET_KEY_V3'])
    checkbox_success = verify_recaptcha(secret_key: ENV['RECAPTCHA_SECRET_KEY_V2']) unless success
    @rr = recaptcha_reply
    if success || checkbox_success
      true
    else
      unless success
        @show_checkbox_recaptcha = true
        return
      end
    end
  end


# GET /resource/sign_in
# def new
#   super
# end

# POST /resource/sign_in
# def create
#   super
# end

# DELETE /resource/sign_out
# def destroy
#   super
# end

# protected
#
#   # If you have extra params to permit, append them to the sanitizer.
#   def configure_sign_in_params
#     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
#   end

end