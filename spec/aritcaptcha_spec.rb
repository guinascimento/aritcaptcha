require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
 
describe "Aritcaptcha" do
  it "should return the correct sum of its arguments" do
    Aritcaptcha::Calculation.generate_calculation(10, 10, "+").should have(2).items
  end

  it "should return the subtraction of its arguments" do
    Aritcaptcha::Calculation.generate_calculation(20, 10, "-").should have(2).items
  end

  it "should return the division of its arguments" do
    Aritcaptcha::Calculation.generate_calculation(10, 2, "/").should have(2).items
  end

  it "should return the multiplication of its arguments" do
    Aritcaptcha::Calculation.generate_calculation(10, 10, "*").should have(2).items
  end
end
