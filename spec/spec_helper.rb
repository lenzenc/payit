if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear! 'rails'
else
  require 'simplecov'
  SimpleCov.start 'rails'
end
require 'devise'

RSpec.configure do |config|

  config.alias_it_should_behave_like_to :it_validates, "it_validates"
  config.alias_it_should_behave_like_to :it_raises, "it_raises"
  config.alias_it_should_behave_like_to :it_raises_error, "it_raises_error"

  module OneLinerExpectSyntax
    def expects(subject)
      expect(subject)
    end
  end

  config.include OneLinerExpectSyntax
  config.include Devise::TestHelpers, :type => :controller

end
