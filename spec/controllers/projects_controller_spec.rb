require

describe ProjectsController do

  describe "#destroy" do

    #users can only view projects that they are members of

    before do
      @user = User.create!(
       first_name
       last_name
       email
       password
      )

      @project = Project.create!(
        name: "Acme"
      )
    end



    it "does not allow non-members" do
      session[:user_id] = @user.id
      count = Project.count

      delete :destroy, id: @project.id

      expect(response.status).to eq(404)
      expect(count).to eq(Project.count)

    end

    it "does not allow project members" do
      Membership.create!(
      user: @user,
      project: @project,
      role: 'member'

      )

      session[:user_id] = @user.id
      count = Project.count

      delete :destroy, id: @project.id

      expect(response.status).to eq(404)
      expect(count).to eq(Project.count)
    end

    it "allows owners to delete" do
      Membership.create!(
      user: @user,
      #user_id = @user.id
      project: @project,
      role: 'owner'
      )

      session[:user_id] = @user.id
      count = Project.count

      delete :destroy, id: @project.id

      expect(Project.count).to eq(0)
      #expect(Project.count).to eq(count-1)
      expect(response).to redirect_to(projects_path)
    end


    #IN: Project Controller under DESTROY:
    #role = owner
    #project_id has to match
    #map user_id to current_user
    #memberships = @project.memberships.where(role: 'owner', user_id: current_user)
    #this will return an array of memberships where the 3 things are true
    # [] array of memberships [<Membership>] note: an empty array
    # if memberships.empty?  (meaning not authorized)
    # else project destroy goes here
    #end

    # redirect_to projects_path
    # render 'public/404', status: 404

    it "allows admins to delete" do
    end
