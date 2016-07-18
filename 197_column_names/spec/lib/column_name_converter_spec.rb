require 'pry'
require 'column_name_converter'

describe ColumnNameConverter do
  let(:column_name_converter) { described_class.new(input) }
  let(:perform) { column_name_converter.excel_header }

  describe '#excel_header' do
    context 'single-letter column' do
      let(:input) { 26 }

      it 'returns correct header' do
        expect(perform).to eq 'Z'
      end
    end

    context 'multi-letter column' do
      let(:input) { 3702 }

      it 'returns correct header' do
        expect(perform).to eq 'ELJ'
      end
    end
  end
end
