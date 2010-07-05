module Aritcaptcha

  module AritcaptchaHelper
    ADD = '+'
    SUB = '-'
    DIV = '/'
    MUL = '*'

    OPERATIONS = [ADD, SUB, DIV, MUL]

    def aritcaptcha_tag(options={})
      equation_key = Time.now.to_i 
      operations = {:add => "+", :sub => "-", :mul => "*", :div => "/"}

      equation, result = Aritcaptcha::Calculation.generate_calculation number1, number2, operation
      session[:equation] = [equation_key, eval(equation)]
      puts "=========================================================="
      puts equation
      puts result
      puts "=========================================================="

      operator = nil
      if options[:op] == nil
        operator = operations.to_a[rand(operations.size)][1]
      else
        non_default_operations = {}
        options[:op].each do |op|
        non_default_operations[op] = operations[op]
      end
        operator = non_default_operations.to_a[rand(non_default_operations.size)][1]
      end

      options = {
        :one => 50,
        :two => 50
      }.merge options

      options[:op] = operator

      if options[:html]
        options = options[:html].inject([]){|dump, pair| dump << "#{pair[0]}=\"#{pair[1]}\""}
        options.join(" ")
      end 

      html = "#{equation} = <input type='text' name='equation' #{options} />"
      html << %{<input type="hidden" name="equation_key" value="#{equation_key}" />\n}
      html
    end
  end

end