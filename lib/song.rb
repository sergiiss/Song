module BottlesOfBeer
  class Song
    def initialize
      @ending               = "s"
      @action_on_the_bottle = "Take one down and pass it around"
      @bottles              = 99
    end

    def print_couplets
      print_initial_couplets
      print_last_couplet
    end

    private

    attr_reader :initial_number_of_bottles, :remaining_number_of_bottles,
                :ending_of_the_word, :ending, :action_on_the_bottle, :bottles

    def print_initial_couplets
      while bottles != 0
        set_a_list_of_conditions
        couplet

        @bottles -= 1
      end
    end

    def set_a_list_of_conditions
      set_the_conditions_for_the_initial_couplets
      set_the_condition_for_two_bottles
      set_a_conditions_for_one_bottle
    end

    def set_the_conditions_for_the_initial_couplets
      @initial_number_of_bottles   = bottles
      @remaining_number_of_bottles = bottles - 1
      @ending_of_the_word          = "s"
    end

    def set_the_condition_for_two_bottles
      @ending_of_the_word = "" if bottles == 2
    end

    def set_a_conditions_for_one_bottle
      if bottles == 1
        @remaining_number_of_bottles  = "No more"
        @initial_number_of_bottles    = bottles
        @ending                       = ""
      end
    end

    def print_last_couplet
      set_the_conditions_for_the_last_couplet
      couplet
    end

    def set_the_conditions_for_the_last_couplet
      @action_on_the_bottle        = "Go to the store and buy some more"
      @initial_number_of_bottles   = remaining_number_of_bottles
      @remaining_number_of_bottles = 99
      @ending                      = "s"
    end

    def couplet
      puts  "#{initial_number_of_bottles} bottle#{ending} of beer on the wall, "    +
            "#{initial_number_of_bottles}".downcase + " bottle#{ending} of beer.\n" +
            "#{action_on_the_bottle}," + " #{remaining_number_of_bottles}".downcase +
            " bottle#{ending_of_the_word} of beer on the wall.\n\n"
    end
  end
end
