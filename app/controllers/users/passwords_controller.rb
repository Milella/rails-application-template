class Users::PasswordsController < Devise::PasswordsController

  prepend_before_action :pw_reset_check_captcha, only: [:create]

  attr_accessor :show_checkbox_recaptcha

  private

    def pw_reset_check_captcha
      return if check_captcha?
      self.resource = resource_class.new
      respond_with_navigational(resource) do
        flash.discard(:recaptcha_error) # We need to discard flash to avoid showing it on the next page reload
        render :new
      end
    end

    def check_captcha?
      logger.debug "\n\n Inside check_captcha METHOD:\n\n"
      success = verify_recaptcha(action: 'password', minimum_score: 0.75)# || success = verify_recaptcha(action: 'edit', minimum_score: 0.5)
      checkbox_success = verify_recaptcha(secret_key: ENV['RECAPTCHA_SECRET_KEY_V2']) unless success
      # @rr = recaptcha_reply
      if success || checkbox_success
        # logger.debug "\n\n In check_captcha IF\n\n"
        # logger.debug "\n\n reCAPTCHA Reply Object:#{@rr.inspect}\n\n"
        true
      else
        # logger.debug "\n\n In check_captcha ELSE\n\n"
        # logger.debug "\n\n reCAPTCHA Reply Object:#{@rr.inspect}\n\n"
        @show_checkbox_recaptcha = true
        return
      end
    end


    # GET /resource/password/new
    # def new
    #   super
    # end

    # POST /resource/password
    # def create
    #   super
    # end

    # GET /resource/password/edit?reset_password_token=abcdef
    # def edit
    #   super
    # end

    # PUT /resource/password
    # def update
    #   super
    # end

    # protected

    # def after_resetting_password_path_for(resource)
    #   super(resource)
    # end

    # The path used after sending reset password instructions
    # def after_sending_reset_password_instructions_path_for(resource_name)
    #   super(resource_name)
    # end

end