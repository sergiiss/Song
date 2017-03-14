class Couplet
  attr_reader :bottle_number
  attr_reader :created_couplet

  def initialize(bottle_number)
    @bottle_number = bottle_number

    @ending_of_primary_bottles = 's'
    @action_on_the_bottle      = 'Take one down and pass it around'
  end

  def create_couplet
    if up_to_three_bottles_on_the_wall?
      set_the_conditions_for_the_initial_couplets
    elsif two_bottles_on_the_wall?
      set_the_condition_for_two_bottles
    elsif one_bottles_on_the_wall?
      set_a_conditions_for_one_bottle
    elsif zero_bottles_on_the_wall?
      set_the_conditions_for_the_last_couplet
    end

    use_couplet_pattern
  end

  private

  attr_reader :initial_number_of_bottles, :remaining_number_of_bottles,
              :ending_of_the_remaining_bottles, :ending_of_primary_bottles,
              :action_on_the_bottle

  def up_to_three_bottles_on_the_wall?
    bottle_number > 2
  end

  def set_the_conditions_for_the_initial_couplets
    @initial_number_of_bottles       = bottle_number
    @remaining_number_of_bottles     = bottle_number - 1
    @ending_of_the_remaining_bottles = 's'
  end

  def two_bottles_on_the_wall?
    bottle_number == 2
  end

  def set_the_condition_for_two_bottles
    @initial_number_of_bottles       = bottle_number
    @remaining_number_of_bottles     = bottle_number - 1
    @ending_of_the_remaining_bottles = ''
  end

  def one_bottles_on_the_wall?
    bottle_number == 1
  end

  def set_a_conditions_for_one_bottle
    @initial_number_of_bottles   = bottle_number
    @remaining_number_of_bottles = 'No more'
    @ending_of_primary_bottles   = ''
  end

  def zero_bottles_on_the_wall?
    bottle_number == 0
  end

  def set_the_conditions_for_the_last_couplet
    @initial_number_of_bottles   = 'No more'
    @remaining_number_of_bottles = 99
    @action_on_the_bottle        = 'Go to the store and buy some more'
    @ending_of_primary_bottles   = 's'
  end

  def use_couplet_pattern
    @created_couplet =
      "#{initial_number_of_bottles} bottle#{ending_of_primary_bottles} of beer on the wall, "    +
      "#{initial_number_of_bottles}".downcase + " bottle#{ending_of_primary_bottles} of beer.\n" +
      "#{action_on_the_bottle}," + " #{remaining_number_of_bottles}".downcase +
      " bottle#{ending_of_the_remaining_bottles} of beer on the wall.\n\n"
  end
end
