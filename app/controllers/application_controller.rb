class ApplicationController < ActionController::Base
    def hello
        render html: 'Hey Toy App'
    end
end
