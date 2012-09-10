require 'yaml'
require 'github_api'

module Diffhub
  class GitHub
    attr_reader :github_gist

    def initialize
      credentials = YAML.load_file(ENV['HOME'] + '/.github_config.yml')

      raise ArgumentError, "No password given" unless credentials['password']
      raise ArgumentError, "No login given" unless credentials['login']
      @github_gist = ::Github::Gists.new credentials
    end

    def upload_diff!
      response = github_gist.create(:public => false, :files => {'git.diff' => {:content => `git diff`}}, :description => '')
      p response.html_url
    rescue Github::Error::UnprocessableEntity
      p 'no diff given'
    end
  end
end
