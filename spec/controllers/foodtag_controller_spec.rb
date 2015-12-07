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

    it 'does not create a foodtag if params are not correct' do
      foodtag_params = { foodtag: "no description"}
      expect { post :create, foodtag_params}.to raise_error(NoMethodError)
    end

  end

  context '#show all photos related to selected foodtag' do
    let(:user)  { FactoryGirl.create(:user) }
    let(:sample_photo) { Photo.create(restaurant_name: "New Restaurant",
                            restaurant_address: "123 New Street",
                            user: user,
                            image: Rack::Test::UploadedFile.new(Rails.root.join('seed_photos', 'fish.jpg'), 'image/jpeg'),
                            dish_name: "delicious",
                            lng: 12.2132,
                            lat: 13.4241) }
    let(:sample_foodtag) {FactoryGirl.create(:foodtag)}

    it 'shows photo objects' do
        FoodtagPhoto.create(photo: sample_photo, foodtag: sample_foodtag)
        get :show, id: sample_foodtag.id
        expect(assigns(:foodtag_photos).first).to be_a_kind_of Photo
    end

    it 'shows the photos with the selected foodtag' do
        FoodtagPhoto.create(photo: sample_photo, foodtag: sample_foodtag)
        get :show, id: sample_foodtag.id
        expect(assigns(:foodtag_photos).first.id).to eq(sample_photo.id)
    end
  end

end