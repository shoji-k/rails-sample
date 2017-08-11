class Photo < ApplicationRecord
  mount_uploader :name, PhotoUploader
  validate :name_size

  def to_jq_upload
    {
      "name" => read_attribute(:name),
        "size" => name.size,
        "url" => name.url,
        # "thumbnail_url" => name.thumb.url,
        "delete_url" => Rails.application.routes.url_helpers.photo_path(id: id),
        "delete_type" => "DELETE"
    }
  end

  private
    def name_size
      if name.size > 5.megabytes
        errors.add(:name, "should be less than 5MB")
      end
    end
end
