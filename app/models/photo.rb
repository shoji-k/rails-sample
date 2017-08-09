class Photo < ApplicationRecord
  mount_uploader :name, PhotoUploader
  validate :name_size

  private
    def name_size
      if name.size > 5.megabytes
        errors.add(:name, "should be less than 5MB")
      end
    end
end
