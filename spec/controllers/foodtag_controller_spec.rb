require 'rails_helper'

RSpec.describe FoodtagsController do

  it '#index displays 10 random foodtags from all foodtags' do
    get :index
    expect(assigns(:foodtags)).to eq(Foodtag.all.sample(10))
  end


  context '#create foodtags' do

    it 'renders a JSON object when saved correctly' do
      json = {:foodtag => {:description => "food"}}
      post :create, json
      response.should be_success
    end

  end

end