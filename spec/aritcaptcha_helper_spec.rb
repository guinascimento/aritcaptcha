require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "AritcaptchaHelper" do
  before :each do
    @helper = Captcha::AritcaptchaHelper.new
  end
  
  it "should accept two numbers and the operator as argument" do
    puts @helper.aritcaptcha_tag :html => { :one => "10", :two => "10", :operation => "+" }
  end
end
