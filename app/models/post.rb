class Post < ActiveRecord::Base
  LOCATIONS = ["Manhattan", "Brooklyn", "Queens", "Staten Island", "Bronx", "Westchester", "Hoboken", "Jersey City"]

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_attached_file :image, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}
  has_attached_file :image1, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}
  has_attached_file :image2, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}
  has_attached_file :image3, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}
  has_attached_file :image4, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}
  has_attached_file :image5, styles: {
		small: "64x64",
		med: "200x200",
		large: "800x800"
	}

  validates :location, inclusion: { in: LOCATIONS }


	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :image1, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :image2, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :image3, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :image4, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  validates_attachment :image5, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  def attachments
    [:image, :image1, :image2, :image3, :image4, :image5].map do |assn|
      self.try(assn)
    end.reject do |img|
      img.url.include? "missing.png"
    end
  end
end
