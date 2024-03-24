class Jokenpo
  AVAILABLE_MOVES = %w[rock paper scissors].freeze
  WINNING_MOVES = { 'rock' => 'scissors', 'paper' => 'rock', 'scissors' => 'paper' }.freeze

  def self.play(...) = new(...).play

  def initialize(input, machine = AVAILABLE_MOVES.sample)
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

  def validate!
    return if [input, machine].all? { |move| AVAILABLE_MOVES.include?(move) }

    raise ArgumentError, "Invalid move: #{input} or #{machine}"
  end
end
