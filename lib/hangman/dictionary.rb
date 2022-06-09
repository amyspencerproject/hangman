module Hangman
  module Dictionary
    WORDS = (IO.read("../../words.txt")).split(nil)

    def self.random
      WORDS.sample
    end   
  end
end
