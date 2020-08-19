# PHASE 2 # convert_to_int rescue, and return nil
def convert_to_int(str)
  
    Integer(str) # =>
  rescue ArgumentError
    puts "Hey thats not an integer ya goof"
    str = gets.chomp.to_i
  ensure
    nil
  
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class NowCoffeeError < StandardError; end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    begin
      if maybe_fruit == "coffee"
        raise NowCoffeeError
      else
        raise StandardError
      end
        rescue NowCoffeeError
          puts "I do like coffee but would want fruit."
          reaction(gets.chomp)
        rescue StandardError
          puts "You suck.. you don't know me"
    end
  end
end


def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)

end  

# PHASE 4

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise "Do I know you?"
    elsif name.length < 1
      raise "That's not even a name"
    elsif fav_pastime.length < 1
      raise "Air hockey atleast"
    end
    rescue RuntimeError
      puts " You did something wrong"
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end
