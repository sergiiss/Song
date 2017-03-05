require 'minitest/autorun'
require_relative 'couplet'
require_relative 'ninety_nine_bottles'

class TestSong < Minitest::Test
  def test_print_couplet_for_initial_bottles
    couplet = Couplet.new(98)
    result = couplet.create_couplet
    expected_result =
    <<~COUPLET
      98 bottles of beer on the wall, 98 bottles of beer.
      Take one down and pass it around, 97 bottles of beer on the wall.\n
    COUPLET

    assert_equal expected_result, result
  end

  def test_print_couplet_for_two_bottles
    couplet = Couplet.new(2)
    result = couplet.create_couplet
    expected_result =
    <<~COUPLET
      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.\n
    COUPLET

    assert_equal expected_result, result
  end

  def test_print_couplet_for_one_bottle
    couplet = Couplet.new(1)
    result = couplet.create_couplet
    expected_result =
    <<~COUPLET
      1 bottle of beer on the wall, 1 bottle of beer.
      Take one down and pass it around, no more bottle of beer on the wall.\n
    COUPLET

    assert_equal expected_result, result
  end

  def test_print_couplet_for_zero_bottles
    couplet = Couplet.new(0)
    result = couplet.create_couplet
    expected_result =
    <<~COUPLET
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottle of beer on the wall.\n
    COUPLET

    assert_equal expected_result, result
  end

  def test_print_couplets_for_three_bottles
    song = NinetyNineBottlesOfBeer.new(3)
    result = song.create_song
    expected_result =
    <<~SONG
      3 bottles of beer on the wall, 3 bottles of beer.
      Take one down and pass it around, 2 bottles of beer on the wall.

      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.

      1 bottle of beer on the wall, 1 bottle of beer.
      Take one down and pass it around, no more bottle of beer on the wall.

      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottle of beer on the wall.\n
    SONG

    assert_equal expected_result, result
  end
end
