class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turns = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turns += 1
      end
    end
    return turns
  end

  def current_player
    turns = turn_count
    if turns % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      taken = combo.all? do |pos|
        position_taken?(pos)
      end
      if (@board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && taken)
        return combo
          end
    end
    return false
  end

  def full?
   return !@board.include?(" ")
  end

  def draw?
    return !won? && full?
  end

  def over?
    return won? || draw? || full?
  end

  def winner
    win_pos = won?
    if (win_pos)
      return @board[win_pos[0]]
    else
      return nil
    end
  end

  # Define your play method below
  def play
    while !over?
      turn
      if won?
        if winner == "X"
          puts "Congratulations X!"
        else
          puts "Congratulations O!"
        end
      elsif draw?
        puts "Cats Game!"
        end
    end
    if won?
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    elsif draw?
      puts "Cat's Game!"
      end
  end
end
