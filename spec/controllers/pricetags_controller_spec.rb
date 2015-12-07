require 'rails_helper'

RSpec.describe PricetagsController do
  let(:user)  { FactoryGirl.create(:user) }
  let(:sample_photo) { Photo.create(restaurant_name: "New Restaurant",
                      restaurant_address: "123 New Street",
                      user: user,
                      image: Rack::Test::UploadedFile.new(Rails.root.join('seed_photos', 'fish.jpg'), 'image/jpeg'),
                      dish_name: "delicious",
                      lng: 12.2132,
                      lat: 13.4241) }

  let(:sample_pricetag) { FactoryGirl.create(:pricetag) }

  it '#show the photos with specified pricetag' do
    PhotoPricetag.create(photo: sample_photo, pricetag: sample_pricetag)
    get :show, id: sample_pricetag.id
    expect(assigns(:photo_pricetags).first).to be_a_kind_of Photo
    expect(assigns(:photo_pricetags).first.id).to eq sample_photo.id
  end  


end