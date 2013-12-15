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

    end
  end
end
