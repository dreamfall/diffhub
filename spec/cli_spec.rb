require 'spec_helper'

describe Diffhub::Cli do
  describe '#args' do
    it 'returns empty array if no arguments passed' do
      cli = described_class.new
      cli.args.should eq([])
    end

    it 'returns passed arguments' do
      cli = described_class.new(%w[hello there])
      cli.args.should eq(%w[hello there])
    end
  end

  describe '#execute!' do
    it 'does nothing yet'
  end
end
