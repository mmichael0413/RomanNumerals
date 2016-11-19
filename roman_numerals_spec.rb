require 'rspec'
require_relative 'roman_numerals'

describe RomanNumerals do

  let(:roman_numerals) { RomanNumerals.new }

  describe '#run!' do
    context 'when the user enters a valid number' do
      it 'should call the answer! method with the result' do
        allow_any_instance_of(RomanNumerals).to receive(:welcome!).and_return(1999)
        expect_any_instance_of(RomanNumerals).to receive(:answer!).with('MCMXCIX')
          .and_return('Your number in Roman numerals is MCMXCIX')
        roman_numerals.run!
      end
    end
  end

  describe '#invalid?' do
    context 'with an integer between 1 and 3000' do
      it 'should return false' do
        invalid = roman_numerals.invalid?(50)
        expect(invalid).to be false
      end
    end

    context 'with a string' do
      it 'should return true' do
        invalid = roman_numerals.invalid?('5')
        expect(invalid).to be true
      end
    end

    context 'with an integer greater than 3000' do
      it 'should return true' do
        invalid = roman_numerals.invalid?(3001)
        expect(invalid).to be true
      end
    end
  end

  describe '#answer!' do
    it 'should print a message with the result' do
      expect(STDOUT).to receive(:puts).with('Your number in Roman numerals is IX')
      roman_numerals.answer!('IX')
    end
  end

  describe '#welcome!' do
    it 'should return the integer value of user input' do
      expect_any_instance_of(RomanNumerals).to receive(:gets).and_return('45')
      result = roman_numerals.welcome!
      expect(result).to eq(45)
    end
  end

end
