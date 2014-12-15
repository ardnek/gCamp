class PivotalStoriesController < ApplicationController

  def show
    tracker_api = TrackerAPI.new
    @tracker_stories = tracker_api.stories(current_user.pivotal_tracker_token, params[:id])
    @tracker_projects = tracker_api.projects(current_user.pivotal_tracker_token)

    @tracker_projects.each do |project|
      if params[:id].to_s == project.id.to_s
        @name = project.name
      end
    end
  end
end
