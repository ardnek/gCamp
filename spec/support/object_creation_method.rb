module ObjectCreationMethods
  def create_project(overrides = {})
    Project.create!(overrides)
  end

  def create_user(overrides = {})
    defaults = {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      password: "password",
      email: Faker::Internet.email,
    }
    User.create!(defaults.merge(overrides))
  end

  def create_memberships(overrides = {})
    defaults ={

      user: new_user,
       ......
       
    }
end
