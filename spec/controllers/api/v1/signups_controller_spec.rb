require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::SignupsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Application. As you add validations to Application, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    FactoryGirl.build(:signup)
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ApplicationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'Api v1 signup' do
    context  do
      it 'create signup' do
        post :create, format: :json, signup: FactoryGirl.attributes_for(:signup).as_json
        expect(response.status).to eq 201
        expect(JSON.parse(response.body).keys).to contain_exactly('id', 'name', 'email', 'age', 'activity', 'source', 'expect', 'why', 'places', 'languages', 'created_at')
        expect(WebMock).to have_requested(:post, /api.hipchat.com/)
      end
    end
  end
end
