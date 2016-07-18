require 'column_name_converter'

describe ColumnNameConverter do
  let(:column_name_converter) { described_class.new(input) }

  describe '#convert' do
    context 'first column' do
      let(:input) { 1 }

      it 'returns correct header' do
        expect(column_name_converter.excel_header).to eq 'A'
      end
    end

    context 'column in the middle' do
      let(:input) { 3702 }

      it 'returns correct header' do
        expect(column_name_converter.excel_header).to eq 'ELJ'
      end
    end

    context 'last column' do
      let(:input) { 17_576 }

      it 'returns correct header' do
        expect(column_name_converter.excel_header).to eq 'ZZZ'
      end
    end
  end
end
