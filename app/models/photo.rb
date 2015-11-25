class Photo < ActiveRecord::Base

  belongs_to        :user
  belongs_to        :stashes
  has_one           :pricetag, through: :photo_pricetag
  has_one           :photo_pricetag

  has_many          :foodtags, through: :foodtag_photos
  has_many          :foodtag_photos

  delegate          :url, to: :image, prefix: true

  # acts_as_mappable

  has_attached_file :image, styles: { medium: "300x300#", thumb: "200x200>" },
                    :default_style => :medium
                    # processors: [:thumbnail, :compression],
                    # :convert_options => { :thumb => '-quality 80'}
  validates_attachment :image, presence: true,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
                       # size: { in: 0..500.kilobytes }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def associate_to_foodtags(tag_list)
    tag_list.each do |tag_name|
      tag_name = tag_name.downcase
      new_tag = Foodtag.find_or_create_by(description: tag_name.strip)
      unless self.foodtags.include?(new_tag)
        self.foodtags << new_tag
      end
    end
  end
end
