module Aritcaptcha

  module AritcaptchaHelper
    ADD = '+'
    SUB = '-'
    DIV = '/'
    MUL = '*'

    OPERATIONS = [ADD, SUB, DIV, MUL]

   def aritcaptcha_tag(options={})
      equation_key = Time.now.to_i

      default_operations = {:add => "+", :sub => "-", :mul => "*", :div => "/"}

      operator = nil
      if options[:operations] == nil
         operator = default_operations.to_a[rand(default_operations.size)][1]
      else
         non_default_operations = {}
         options[:operations].each do |op|
            non_default_operations[op] = default_operations[op]
         end
	       operator = non_default_operations.to_a[rand(non_default_operations.size)][1]
      end

      equation, result = Aritcaptcha::Calculation.generate_calculation 50, 50, operator

      session[:equation] = [equation_key, eval(equation)]

      if options[:html]
        options = options[:html].inject([]){|dump, pair| dump << "#{pair[0]}=\"#{pair[1]}\""}
        options = options.join(" ")
      end

      html = ""
      if options[:format] == "image"
      	 session[:image] = equation_key
         img = generate_image equation_key, equation
         html << "<img src=\"/images/aritcaptcha/#{img}\" style='vertical-align:top;' /> <input type=\"text\" name=\"equation\" size=\"3\" style='vertical-align:top;' #{options} />"
      else
      	html << "#{equation} = <input type=\"text\" name=\"equation\" style='vertical-align:top;' size=\"3\" #{options} /></div>"
      end

      html << "<input type=\"hidden\" name=\"equation_key\" value=\"#{equation_key}\" /> \n"
    end

    def generate_image(equation_key, equation)
      relative_name = "#{equation_key}.png"
      full_path     = "#{Rails.root}/public/images/aritcaptcha/#{relative_name}"

      unless File.file?(full_path)
         image = Magick::Image.new(85, 25)
         image.format = "PNG"
         title = Magick::Draw.new
 
         title.annotate(image, 5, 5, 5, 5, equation + " =") do
           self.fill        = "#333"
           self.font        = Rails.root + "/fonts/Clarenton LT Bold.ttf"
           self.font_family = "Clarenton LT Bold"
           self.font_weight = Magick::BoldWeight
           self.gravity     = Magick::NorthWestGravity
           self.pointsize   = 20
         end
         image.write(full_path)
      end      
       relative_name
    end
  end

end