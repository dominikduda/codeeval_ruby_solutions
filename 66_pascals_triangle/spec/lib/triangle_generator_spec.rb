require 'triangle_generator'

describe TriangleGenerator do
  describe '#generate' do
    let(:perform) { described_class.new(input).generate }

    # context 'with depth smaller than 1' do
    #   let(:input) { 0 }

    #   it 'raises an exception' do
    #     expect { perform }.to raise_error(ArgumentError)
    #   end
    # end

    # context 'with float passed as argument' do
    #   let(:input) { 1.1 }

    #   it 'raises an exception' do
    #     expect { perform }.to raise_error(ArgumentError)
    #   end
    # end

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

  describe '#depth=' do
    let(:perform) { described_class.new(2).depth = input }

    context 'with depth smaller then 1' do
      let(:input) { 0 }

      it { expect { perform }.to raise_error(ArgumentError) }
    end

    context 'with float-depth' do
      let(:input) { 1.23 }

      it { expect { perform }.to raise_error(ArgumentError) }
    end
  end
end

