require 'spec_helper'

describe Diffhub::GitHub do
  describe '.new' do
    it 'passes login and password to github API gem' do
      credentials = {'login' => 'gorbypuff', 'password' => 'thecat' }
      YAML.stub(:load_file) { credentials }
      Github::Gists.should_receive(:new, credentials)
      gh = described_class.new
    end

    it 'raises error if no password given in credentials file' do
      credentials = {'login' => 'gorbypuff'}
      YAML.stub(:load_file) { credentials }
      Github::Gists.stub(:new)
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it 'raises error if no login given in credentials file' do
      credentials = {'password' => 'thecat'}
      YAML.stub(:load_file) { credentials }
      Github::Gists.stub(:new)
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end

  describe "#upload_diff!" do
    it 'sends gist to a github' do
      gh_gist = mock(:gh_api)
      args = {:public => false, :files => {'git.diff' => {:content => "superdiff"}}, :description => ''}
      gh_gist.should_receive(:create).with(args) { mock(html_url: '') }
      Diffhub::GitHub.any_instance.stub(:github_gist) { gh_gist }
      module Kernel
        def `(cmd)
          'superdiff'
        end

        def p(_); end
      end
      credentials = {'login' => 'gorbypuff', 'password' => 'thecat' }
      YAML.stub(:load_file) { credentials }
      Github::Gists.stub(:new)
      Diffhub::GitHub.new.upload_diff!
    end
  end
end
