module Diffhub
  class Cli
    attr_reader :args, :github

    def initialize(args=[])
      @args = args
      @github = GitHub.new
    end

    def execute!
      github.upload_diff!
    end
  end
end
