class RomanNumerals

  NUMERALS = { 
    1000 => 'M',
    900  => 'CM',
    500  => 'D',
    400  => 'CD',
    100  => 'C',
    90   => 'XC',
    50   => 'L',
    40   => 'XL',
    10   => 'X',
    9    => 'IX',
    5    => 'V',
    4    => 'IV',
    1    => 'I'
  }

  def initialize
    run!
  end

  def run!
    number = welcome!
    if invalid?(number)
      run!
    else
      result = ''

      NUMERALS.each do |int, numeral|
        while number >= int
          result += numeral
          number -= int
        end
      end

      answer! result
    end
  end

  def exact_match?(number)
    NUMERALS.key?(number)
  end

  def invalid?(number)
    !number.is_a?(Integer) || number < 0 || number > 3000
  end

  def answer!(result)
    puts "Your number in Roman numerals is #{result}"
  end

  def welcome!
    print 'Enter number to convert to Roman numerals (between 1 and 3000): '
    gets.chomp.to_i
  end

end

RomanNumerals.new
