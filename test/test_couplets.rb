require 'minitest/autorun'
require 'song'

class TestSong < Minitest::Test
  def setup
    @song = Song::NinetyNineBottlesOfBeer.new
  end

  def test_print_couplet_for_initial_bottles
    @song.current_bottle_number = 98
    result = @song.current_couplet

    assert_equal "98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.\n\n", result
  end

  def test_print_couplet_for_two_bottles
    @song.current_bottle_number = 2
    result = @song.current_couplet

    assert_equal "2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.\n\n", result
  end

  def test_print_couplet_for_one_bottles
    @song.current_bottle_number = 1
    result = @song.current_couplet

    assert_equal "1 bottle of beer on the wall, 1 bottle of beer.
Take one down and pass it around, no more bottle of beer on the wall.\n\n", result
  end

  def test_print_couplet_for_zero_bottles
    @song.current_bottle_number = 0
    result = @song.current_couplet

    assert_equal "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottle of beer on the wall.\n\n", result
  end
end
