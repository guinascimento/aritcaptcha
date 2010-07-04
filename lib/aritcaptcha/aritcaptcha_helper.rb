module Aritcaptcha

  module AritcaptchaHelper
    ADD = '+'
    SUB = '-'
    DIV = '/'
    MUL = '*'

    OPERATIONS = [ADD, SUB, DIV, MUL]

    def aritcaptcha_tag(options={})
      number1 = options[:one] || 50
      number2 = options[:two] || 50
      operation = options[:op] || OPERATIONS[rand(OPERATIONS.size)]

      equation, result = Aritcaptcha::Calculation.generate_calculation number1, number2, operation
      
      html_options = options[:html].inject([]){|dump, pair| dump << "#{pair[0]}=\"#{pair[1]}\""}
      html_options.join(" ")
      puts html_options
       

      html = "#{equation} = <input type='text' name='equation' #{html_options} />"
      html
    end
  end

end