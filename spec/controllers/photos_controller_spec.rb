require 'rails_helper'

describe PhotosController do
  let(:user)  { FactoryGirl.create(:user) }
  let(:photo) { Photo.create(restaurant_name: "New Restaurant",
                            restaurant_address: "123 New Street",
                            user: user,
                            image: Rack::Test::UploadedFile.new(Rails.root.join('seed_photos', 'fish.jpg'), 'image/jpeg'),
                            dish_name: "delicious",
                            lng: 12.2132,
                            lat: 13.4241) }

  it '#new' do
    get :new
    expect(assigns(:photo)).to be_a_kind_of(Photo)
  end

  context '#creates' do
    it 'creates a photo with valid params' do
      user = FactoryGirl.create(:user)
      photo_params = {photo: {restaurant: "New Restaurant",
                              restaurant_address: "123 New Street",
                              user: user,
                              image: Rack::Test::UploadedFile.new(Rails.root.join('seed_photos', 'fish.jpg'), 'image/jpeg'),
                              foodtags:'abc',
                              dish_name: "delicious",
                              lng: 12.2132,
                              lat: 13.4241} }
      expect {
        post :create, photo_params
      }.to change(Photo, :count).by(1)
    end

    it 'does not create a question with invalid params' do
      expect {
        post :create, photo: FactoryGirl.attributes_for(:user)
      }.to_not change(Photo, :count)
    end
  end

  it '#show' do
    get :show, id: photo.id
    expect(assigns(:photo)).to be_a_kind_of(Photo)
  end

end
