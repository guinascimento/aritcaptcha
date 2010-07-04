require 'aritcaptcha/aritcaptcha_helper'

ActionView::Base.send(:include, Aritcaptcha::AritcaptchaHelper)
ActionController::Base.send(:include, Aritcaptcha::AritcaptchaVerify)