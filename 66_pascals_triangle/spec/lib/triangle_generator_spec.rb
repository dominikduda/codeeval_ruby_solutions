require 'triangle_generator'

describe TriangleGenerator do
  let(:perform) { described_class.new(input).generate }

  describe '#generate' do
    context 'with depth smaller than 1' do
      let(:input) { 0 }

      it 'raises an exception' do
        expect(perform).to raise_error
      end
    end

    context 'with depth 1' do
      let(:input) { 1 }

      it 'returns correct triangle' do
        expect(perform).to eq '1'
      end
    end

    context 'with depth 2' do
      let(:input) { 2 }

      it 'returns correct triangle' do
        expect(perform).to eq '1 1 1'
      end
    end

    context 'with depth 6' do
      let(:input) { 6 }

      it 'returns correct triangle' do
        expect(perform).to eq '1 1 1 1 2 1 1 3 3 1 1 4 6 4 1 1 5 10 10 5 1'
      end
    end
  end
end

