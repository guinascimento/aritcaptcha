module Aritcaptcha

  module AritcaptchaVerify
    SOLV_KEY  = 0
    SOLV      = 1

    def verify_aritcaptcha(params)
      if (equation_key = params[:equation_key]) and (equation = params[:equation])
        return (session[:equation] and session[:equation][SOLV_KEY] == equation_key.to_i and session[:equation][SOLV] == equation.to_i)
      end          
    end
  end

end
