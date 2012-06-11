class MathCalculator
  include Math

  def self.calculate(str='', options={})
    @@safe_formula = true
    self.tokenize(str,options)
    options.each {|k,v| @@safe_formula = false unless (k.is_a? Symbol and v.is_a? Numeric)}
    if self.safe_formula?
      options.each do |var, val|
        str = "#{var.to_s} = #{val}; #{str}"
      end
      self.constants_list.each do |const|
        str = "#{const.to_s.downcase} = #{const}; #{str}"
      end
      eval str
    end
  end

  private

  def self.tokenize(str, options={})
    new_str0 = str.gsub(/\s*/,'')
    new_str1 = new_str0.gsub(/[a-zA-Z]+/,' \0 ')
    new_str2 = new_str1.gsub(/\d*\.?\d+/,' \0 ')
    arr1 = new_str2.split(' ')
    new_arr = []
    arr1.each do |token|
      if (self.valid_tokens_list(options).include? token)
        new_arr << token
      elsif token.match(/\d*\.?\d+/) &&
           (token.match(/\d*\.?\d+/)[0] == token)
        new_arr << token
      else
        char_arr = token.split('')
        char_arr.each do |char|
          if self.chars_list.include? char
            new_arr << char
          else
            @@safe_formula = false
          end
        end
      end
    end
   return new_arr
  end

  def self.valid_tokens_list(options)
    (self.public_methods_list +
     self.constants_list +
     self.downcase_constants_list +
     self.user_variables_list(options)
    ).map{|t| t.to_s}
  end

  def self.user_variables_list(options)
    options.keys.map(&:to_s)
  end

  def self.public_methods_list
    (Math.public_methods - Object.methods)
  end

  def self.constants_list
    (Math.constants - [:DomainError])
  end

  def self.downcase_constants_list
    (Math.constants - [:DomainError]).map{|c| c.to_s.downcase}
  end

  def self.chars_list
    %w[+ - / * ( ) ]
  end

  def self.safe_formula?
    @@safe_formula
  end
end
