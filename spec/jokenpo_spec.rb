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

      context 'when input is rock' do
        let(:input) { 'rock' }

        context 'when machine plays rock' do
          let(:machine) { 'rock' }

          it { is_expected.to eq(:draw) }
        end

        context 'when machine plays paper' do
          let(:machine) { 'paper' }

          it { is_expected.to eq(:lose) }
        end

        context 'when machine plays scissors' do
          let(:machine) { 'scissors' }

          it { is_expected.to eq(:win) }
        end
      end

      context 'when input is paper' do
        let(:input) { 'paper' }

        context 'when machine plays rock' do
          let(:machine) { 'rock' }

          it { is_expected.to eq(:win) }
        end

        context 'when machine plays paper' do
          let(:machine) { 'paper' }

          it { is_expected.to eq(:draw) }
        end

        context 'when machine plays scissors' do
          let(:machine) { 'scissors' }

          it { is_expected.to eq(:lose) }
        end
      end

      context 'when input is scissors' do
        let(:input) { 'scissors' }

        context 'when machine plays rock' do
          let(:machine) { 'rock' }

          it { is_expected.to eq(:lose) }
        end

        context 'when machine plays paper' do
          let(:machine) { 'paper' }

          it { is_expected.to eq(:win) }
        end

        context 'when machine plays scissors' do
          let(:machine) { 'scissors' }

          it { is_expected.to eq(:draw) }
        end
      end
    end
  end
end
