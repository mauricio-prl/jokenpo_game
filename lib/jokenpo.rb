class Jokenpo
  AVAILABLE_MOVES = %w[rock paper scissors spock lizard].freeze
  WINNING_MOVES = { 'rock' => %w[lizard scissors],
                    'paper' => %w[rock spock],
                    'scissors' => %w[lizard paper],
                    'lizard' => %w[spock paper],
                    'spock' => %w[scissors rock] }.freeze

  def self.play(...) = new(...).play

  def initialize(input, machine = AVAILABLE_MOVES.sample)
    @input = input
    @machine = machine
  end

  def play
    validate!

    return :draw if input == machine

    WINNING_MOVES[input].include?(machine) ? :win : :lose
  end

  private

  attr_reader :input, :machine

  def validate!
    return if [input, machine].all? { |move| AVAILABLE_MOVES.include?(move) }

    raise ArgumentError, "Invalid move: #{input} or #{machine}"
  end
end
