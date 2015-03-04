# require 'rails_helper'
#
# describe ApplicationController do
#
#   describe "permissions" do
#     controller do
#       def index
#         render nothing: true
#       end
#     end
#
#     it "redirects non-logged in users to signing" do
#       get :index
#       expect(response).to redirect_to(signin_path)
#     end
#   end
#
#   it "allows logged-in users to see pages" do
#     session [user_id] = create_user.id
#       get :index
#       expect(response).to be_success
#     end
#
#   end
