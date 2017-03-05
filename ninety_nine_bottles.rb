require_relative 'couplet'

class NinetyNineBottlesOfBeer
  def initialize(start_bottle_number = 99)
    @current_bottle_number = start_bottle_number
    @song = song.to_s
  end

  def create_song
    while have_enough_bottles?
      @song << current_couplet

      @current_bottle_number -= 1
    end

    song
  end

  private

  attr_reader :current_bottle_number, :song

  def have_enough_bottles?
    current_bottle_number >= 0
  end

  def current_couplet
    couplet = Couplet.new(current_bottle_number)
    couplet.create_couplet
  end
end
