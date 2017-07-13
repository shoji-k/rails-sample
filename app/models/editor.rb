class Editor < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 50 }
  before_save   :set_tex

  private

    def set_tex
      self.tex = change(self.body)
    end

    def change(txt)
      txt
    end
end
