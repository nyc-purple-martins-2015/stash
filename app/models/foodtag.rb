class Foodtag < ActiveRecord::Base
  has_many :foodtag_photos
  has_many :photos, through: :foodtag_photos

  def self.search(description)
    description = description.downcase
    where("description LIKE ?", "%#{description}%")
  end

  def autocomplete_tag_name
    tags = Foodtag.select([:description]).where("description LIKE ?", "%#{params[:search]}%")
    result = tags.collect do |t|
      { value: t.description }
    end
    render json: result
  end
end
