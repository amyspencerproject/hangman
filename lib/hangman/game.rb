module Hangman
  class Game
    attr_reader :chances, :word, :wrong_tries, :guess, :wrong_guess

    def initialize
      @chances = 5
      @wrong_tries = 0
      @guess = ""
      @wrong_guess = ""
      @word = Dictionary.random
    end

    def play
      Graphics.clear_screen
      puts 'Guess this word: ' + Graphics.obfuscate_word(word, '')

      # char = gets.chomp
      char = gets.strip
      empty = char.empty?
      # puts char.class
      # puts empty
      if empty = true
          puts "You must enter a letter to play"
          puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
      end

      while true
        print "[#{chances - wrong_tries} chances left]: "

        char = gets.strip
        Graphics.clear_screen
        
        # empty = char.empty?
        
        # if empty = true
        #   puts "You must enter a letter to play"
        #   puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
        # end

        if word.include? char
        
          if guess.include? char
            puts "You already entered '#{char}'. Yes, it is still correct.. 🙄"
            puts 'Try again: ' + Graphics.obfuscate_word(word, guess)
          else
            guess << char
            placeholder = Graphics.obfuscate_word(word, guess)

            puts 'Whoop Whoop!! ' + placeholder
          end

          unless placeholder.include? Graphics::OBFUSCATION_CHAR
            puts Graphics::ALIVE
            puts "\n\nWELL DONE!! YOU SURVIVED"
            break
          end
        else
          if wrong_guess.include? char
            
            puts "You already entered that and the word still doesn't contain '#{char}' "
          else 
            wrong_guess << char
            puts "OH NOES! The word doesn't contain '#{char}'"
            @wrong_tries = @wrong_tries + 1
          end
          

          if wrong_tries == chances
            puts Graphics::DEAD
            puts "\nARRRRGGGGGGGGGGG YOU LOST! 😭  😵  ☠️"
            break
          else
            puts 'Try another: ' + Graphics.obfuscate_word(word, guess)
          end
        end
      end
    end
  end
end
