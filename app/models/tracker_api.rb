class TrackerAPI

  def initialize
    @conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
  end

  def projects(token)
    response = @conn.get do |req|
      req.url "/services/v5/projects"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
  end
    JSON.parse(response.body, symbolize_names: true)
  end
end


# constructor to construct instances of this class. Allows us to new-up objects
# No behavior in initialize-- you only have state. The state is used throughout the behaviors. Initilize
# it to have it be the first_thing that happens. Need it for every API call.
# Never use global variables-- @@. Only use instance variable @.


# in irb paste code and these two things:
#tracker_api = TrackerAPI.new
#tracker_api.projects(put TrackerAPI # here)


# NOTE:
# objects have two fundamental properties: state and behavior
# instance variable
