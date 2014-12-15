class TrackerAPI

  #assigning state to instance of this class

  def initialize
    @conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
  end

  #behavior
  def projects(token)
    return [] if token.nil?
    response = @conn.get do |req|
      req.url "/services/v5/projects"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
  end

    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed.map do |json|
      PivotalProject.new(json[:id], json[:name])
    #JSON.parse(response.body, symbolize_names: true)
    end
  end

  #behavior
  def stories(token, project_id)
    return [] if token.nil?
    response = @conn.get do |req|
      req.url "/services/v5/projects/#{project_id}/stories?limit=500&offset=0"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end

#def project(token)
#return [ ] if token.nil?
#end

# constructor to construct instances of this class. Allows us to new-up objects
# No behavior in initialize-- you only have state. The state is used throughout the behaviors. Initilize
# it to have it be the first_thing that happens. Need it for every API call.
# Never use global variables-- @@. Only use instance variable @.


# in rails c (or irb) paste code and these two things:
#tracker_api = TrackerAPI.new
#tracker_api.projects(put TrackerAPI # here)


# NOTE:
# objects have two fundamental properties: state and behavior
# instance variable

# REFACTORING:
# def connection
#   Faraday.new(:url => 'https://www.pivotaltracker.com' )
# end
#
# def post(url, token, data)
# response = connection.post do (req)
# req.url url
# req.headers['Content-Type'] = 'application/json'
# req.headers['X-TrackerToken'] = token
# req.body = data.to_json
# end
# end
#
#
# def get(url, token)
#   connection.get do |req|
#     req.url url
#     req.headers['Content-Type'] = 'application/json'
#     req.headers['X-TrackerToken'] = token
# end
# end
# end
#
