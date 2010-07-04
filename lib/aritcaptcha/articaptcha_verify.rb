module Aritcaptcha

  module AritcaptchaVerify
    SOLV_KEY  = 0
    SOLV      = 1

    def verify_articaptcha(params)
      puts params[:equation_key]
      puts params[:equation]
      if (solv_key = params[:equation_key]) and (solv = params[:equation])
        return (session[:equation] and session[:equation][SOLV_KEY] == solv_key.to_i and session[:equation][SOLV] == solv.to_i)
      end          
    end
  end

end
