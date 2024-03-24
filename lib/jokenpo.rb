class Jokenpo
  WINNING_MOVES = { 'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper' }.freeze

  def self.play(...) = new(...).play

  def initialize(input, machine = available_moves.sample)
    @input = input
    @machine = machine
  end

  def play
    validate!

    return :draw if input == machine

    WINNING_MOVES[input] == machine ? :win : :lose
  end

  private

  attr_reader :input, :machine

  def available_moves = WINNING_MOVES.keys

  def validate!
    return if [input, machine].all? { |move| available_moves.include?(move) }

    raise ArgumentError, "Invalid move: #{input} or #{machine}"
  end
end
