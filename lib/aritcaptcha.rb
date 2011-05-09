require 'aritcaptcha/aritcaptcha_helper'
require 'aritcaptcha/aritcaptcha_verify'

ActionView::Base.send(:include, Aritcaptcha::AritcaptchaHelper)
ActionController::Base.send(:include, Aritcaptcha::AritcaptchaVerify)