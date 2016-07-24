require 'triangle_generator'

describe TriangleGenerator do
  let(:triangle_generator) { described_class.new(input) }

  describe '#generate' do
    context 'with depth 1' do
      let(:input) { 1 }

      it 'returns correct triangle' do
        expect(triangle_generator).to eq '1'
      end
    end

    context 'with depth 2' do
      let(:input) { 2 }

      it 'returns correct triangle' do
        expect(triangle_generator).to eq '1 1'
      end
    end

    context 'with depth 6' do
      let(:input) { 6 }

      it 'returns correct triangle' do
        expect(triangle_generator).to eq '1 1 1 1 2 1 1 3 3 1 1 4 6 4 1 1 5 10 10 5 1'
      end
    end
  end
end

