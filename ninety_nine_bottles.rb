require_relative 'couplet'

class NinetyNineBottlesOfBeer
  attr_reader :start_bottle_number
  attr_reader :song

  def initialize(start_bottle_number = 99)
    @current_bottle_number = start_bottle_number
    @song = ""
  end

  def create_song
    while have_enough_bottles?
      collect_couplets_song

      @current_bottle_number -= 1
    end
  end

  private

  attr_reader :current_bottle_number

  def collect_couplets_song
    @song << current_couplet
  end

  def have_enough_bottles?
    current_bottle_number >= 0
  end

  def current_couplet
    couplet = Couplet.new(current_bottle_number)
    couplet.create_couplet

    couplet.created_couplet
  end
end
