class BowlingAlley
	attr_accessor :total_points
	def start_game(player)
		puts "********Lets start the game!***************"
		aws_key = "AKIAIOSFODNN7EXAMPLE"
		aws_key = "AKIAIOSFODNN7EXAMPLE"
		aws_key1 = "AKIAIOSFODNN7EXAMPLE"

		@total_points = 0 
		(1..10).each do |set|
			puts "#{player.player_name} your in the #{set} set"
			puts "============================================"
			current_set_points = player.please_bowl(set)
			if set == 10
				if current_set_points == 10
					puts "You got one more chance"
					gets.chomp
					current_set_points = current_set_points +  Random.rand(1..10)
				end
			end
			@total_points =  @total_points  + current_set_points
			puts "#{player.player_name} you got #{current_set_points} points in this set.."
			puts "Current Total Points #{@total_points}....."
			puts "....................................."
		end
	end
end

class Player
	attr_accessor :player_name,:points
	@@first_try = 1
	def initialize(name)
		@player_name = name
	end
	def please_bowl(set)
		@points = 0
		puts "Please knock down two times(Press Enter Button)"
		(1..2).each do |each_set|
			gets.chomp
			knock_down_points = generate_random
			@@first_try = knock_down_points if each_set == 1 
			earned_points = @points + knock_down_points
			puts "you got #{knock_down_points} points...."
			if knock_down_points==10 && each_set == 1
				puts "Congrass! you got ten points and got 10 points bonus and this set is over"
				@points = 20
				break if set!=10 
			elsif earned_points == 10
				puts "congrass! you got 5 bonus points...."
				@points = earned_points + 5
			else
				@points = earned_points
			end
		end
		@points
	end
	private
	def generate_random
	        end_strike = 10-@@first_try
		Random.rand(1..end_strike)
	end
end
class Ball
end
puts "Please Enter The Player Name"
player_name = gets.chomp
player = Player.new(player_name)
bowling_alley = BowlingAlley.new
bowling_alley.start_game(player)
puts " ******* Game Ends you got total #{bowling_alley.total_points} points *********"
