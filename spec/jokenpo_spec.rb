require 'spec_helper'
require 'jokenpo'

RSpec.describe Jokenpo do
  describe '#play' do
    context 'when playing with the machine' do
      subject(:play) { described_class.play(input, machine) }

      context 'when invalid move' do
        let(:input) { 'dog' }
        let(:machine) { 'dog' }

        it { expect { play }.to raise_error(ArgumentError, 'Invalid move: dog or dog') }
      end

      context 'and input is rock' do
        let(:input) { 'rock' }

        context 'and machine plays rock' do
          let(:machine) { 'rock' }

          it { is_expected.to eq(:draw) }
        end

        context 'and machine plays paper' do
          let(:machine) { 'paper' }

          it { is_expected.to eq(:lose) }
        end

        context 'and machine plays scissors' do
          let(:machine) { 'scissors' }

          it { is_expected.to eq(:win) }
        end

        context 'and machine plays lizard' do
          let(:machine) { 'lizard' }

          it { is_expected.to eq(:win) }
        end

        context 'and machine plays spock' do
          let(:machine) { 'spock' }

          it { is_expected.to eq(:lose) }
        end
      end

      context 'and input is paper' do
        let(:input) { 'paper' }

        context 'and machine plays rock' do
          let(:machine) { 'rock' }

          it { is_expected.to eq(:win) }
        end

        context 'and machine plays paper' do
          let(:machine) { 'paper' }

          it { is_expected.to eq(:draw) }
        end

        context 'and machine plays scissors' do
          let(:machine) { 'scissors' }

          it { is_expected.to eq(:lose) }
        end

        context 'and machine plays lizard' do
          let(:machine) { 'lizard' }

          it { is_expected.to eq(:lose) }
        end

        context 'and machine plays spock' do
          let(:machine) { 'spock' }

          it { is_expected.to eq(:win) }
        end
      end

      context 'and input is scissors' do
        let(:input) { 'scissors' }

        context 'and machine plays rock' do
          let(:machine) { 'rock' }

          it { is_expected.to eq(:lose) }
        end

        context 'and machine plays paper' do
          let(:machine) { 'paper' }

          it { is_expected.to eq(:win) }
        end

        context 'and machine plays scissors' do
          let(:machine) { 'scissors' }

          it { is_expected.to eq(:draw) }
        end

        context 'and machine plays lizard' do
          let(:machine) { 'lizard' }

          it { is_expected.to eq(:win) }
        end

        context 'and machine plays spock' do
          let(:machine) { 'spock' }

          it { is_expected.to eq(:lose) }
        end
      end
    end
  end
end
