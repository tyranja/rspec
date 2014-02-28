module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'There a 4 numbers from 1 to 6.'
      @output.puts 'You have to guess the existence and the exact match.'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      marker = Marker.new(@secret, guess)
      @output.puts '+'*marker.exact_match_count +
                    '-'*marker.number_match_count

      mark = ''
      (0..3).each do |index|
        if exact_match?(guess, index)
          mark << '+'
        end
      end
      (0..3).each do |index|
        if number_match?(guess, index)
          mark << '-'
        end
      end
      @output.puts mark
    end

    def exact_match?(guess, index)
      guess[index] == @secret[index]
    end

    def number_match?(guess, index)
      @secret.include?(guess[index]) && !exact_match?(guess, index)
    end
  end
end
