module Aritcaptcha

  module AritcaptchaHelper
    ADD = '+'
    SUB = '-'
    DIV = '/'
    MUL = '*'

    OPERATIONS = [ADD, SUB, DIV, MUL]

    def aritcaptcha_tag(options={})
      equation_key = Time.now.to_i 
      number1 = options[:one] || 50
      number2 = options[:two] || 50
      operation = options[:op] || OPERATIONS[rand(OPERATIONS.size)]


      equation, result = Aritcaptcha::Calculation.generate_calculation number1, number2, operation


      session[:equation] = [equation_key, eval(equation)]

      if options[:html]
        html_options = options[:html].inject([]){|dump, pair| dump << "#{pair[0]}=\"#{pair[1]}\""}
        html_options.join(" ")
      end 

      html = "#{equation} = <input type='text' name='equation' #{html_options} />"
      html << %{<input type="hidden" name="equation_key" value="#{equation_key}" />\n}
      html
    end
  end

end