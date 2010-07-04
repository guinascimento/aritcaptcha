module Aritcaptcha

  class Calculation
  
    def self.generate_calculation number1, number2, operation
      number1 = rand(number1)
      number2 = rand(number2)
      equation = "#{number1} #{operation} #{number2}"

      # Division by zero
      return [nil, nil] if operation == "/" and number2.zero?

      result = eval("#{number1.to_f} #{operation} #{number2.to_f}")

      [equation, result]
    end

  end

end

puts Aritcaptcha::Calculation.generate_calculation(10, 0, "/")