require 'rails_helper'

RSpec.describe FoodtagsController do
  sample_user = FactoryGirl.create(:user)

  context '#create foodtags' do

    it 'renders a JSON object when saved correctly' do
      json = {:foodtag => {:description => "food"}}
      post :create, json
      response.should be_success
    end

  end
  
end