class Post2 < ActiveRecord::Base
  LOCATIONS = ["Manhattan", "Brooklyn", "Queens", "Staten Island", "Bronx", "Westchester", "Hoboken", "Jersey City"]

  belongs_to :user

  has_attached_file :image, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}

  validates :location, inclusion: { in: LOCATIONS }


	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def attachments
    [:image].map do |assn|
      self.try(assn)
    end.reject do |img|
      img.url.include? "missing.png"
    end
  end
end