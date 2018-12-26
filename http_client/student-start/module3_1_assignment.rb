require 'httparty'

class Recipe
    include HTTParty # includes HTTParty module
    base_uri "http://food2fork.com/api" # sets base f2f_url
    default_params key: ENV["FOOD2FORK_KEY"] # sets a default parameter in options for a HTTP get
    format :json # specifies format of data received


    def self.for(keyword) # class method
        # GET request
        # path on server = "/search"
        # parameters include a keyword to search on
        get("/search", {query: {q: keyword}})["recipes"]
    end

end
