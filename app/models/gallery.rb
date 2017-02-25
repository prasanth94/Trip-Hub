class Gallery < ActiveRecord::Base
  belongs_to :trip
  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename",
    styles: { medium: "300x300>", thumb: "100x100#" }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
