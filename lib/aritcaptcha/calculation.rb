module Aritcaptcha

  class Calculation
  
    def generate_calculation number1, number2, operator
      # Division by zero
      return [nil, nil] if operator == "/" and number1.zero? or number2.zero?

      number1 = rand(number1)
      number2 = rand(number2)

      equation = "#{number1} #{operator} #{number2}"
      result = eval("#{number1.to_f} #{operator} #{number2.to_f}")

      [equation, result]
    end

  end

end