require 'aritcaptcha_helper'

ActionView::Base.send(:include, Captcha::AritcaptchaHelper)
# ActionController::Base.send(:include, Mathcha::MathchaVerify)