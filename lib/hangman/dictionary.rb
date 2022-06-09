module Hangman
  module Dictionary
    # path = File.expand_path('../lib/hangman', __FILE__)
    # $LOAD_PATH.unshift(path) unless $LOAD_PATH.include?(path)
    WORDS = (IO.read("words.txt")).split(nil)

    def self.random
      WORDS.sample
    end   
  end
end
