require 'spec_helper'

describe Diffhub::Cli do
  before do
    Diffhub::GitHub.should_receive(:new)
  end

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
    it 'executes upload to github' do
      cli = described_class.new
      github = mock(:gh)
      github.should_receive(:upload_diff!)
      cli.stub(:github) { github }
      cli.execute!
    end
  end
end
