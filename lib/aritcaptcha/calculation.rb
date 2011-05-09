module Aritcaptcha

  class Calculation
  
    def self.generate_calculation number1, number2, operator, &block
      # Division by zero
      return [nil, nil] if operator == "/" and number1.zero? or number2.zero?

      number1 = rand(number1)
      number2 = rand(number2)

      equation = "#{number1} #{operator} #{number2}"
      result = eval("#{number1.to_f} #{operator} #{number2.to_f}")

      if result.infinite?
        # over and over again untill !infnite
        number1 = rand(number1)
        number2 = rand(number2)
        result = eval("#{number1.to_f} #{operator} #{number2.to_f}")
      end

      result = (result == result.floor) ? result.to_i : result
      [equation, result]
    end

  end

end