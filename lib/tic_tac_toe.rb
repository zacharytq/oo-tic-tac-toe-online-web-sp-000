class TicTacToe
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      temp_array = []
      win_combo.each do |index|
        temp_array << @board[index]
      end
      temp_array == ["O", "O", "O"] || temp_array == ["X", "X", "X"]
    end
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    if full? && !won?
      true
    else
      false
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
    if won?
      puts "Congratulations #{winner}"
    elsif draw?
      puts "Cat's game!"
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
