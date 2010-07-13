module Aritcaptcha

  module AritcaptchaVerify
    SOLV_KEY  = 0
    SOLV      = 1

    def verify_aritcaptcha(params)
      clean session[:image]

      if (equation_key = params[:equation_key]) and (equation = params[:equation])
        return (session[:equation] and session[:equation][SOLV_KEY] == equation_key.to_i and session[:equation][SOLV] == equation.to_i)
      end          
    end

    def clean image
       unless image == nil
          relative_name = "#{image}.png"
          full_path     = "#{Rails.root}/public/images/aritcaptcha/#{relative_name}"
          File.delete(full_path)
       end
    end
  end

end