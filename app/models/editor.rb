class Editor < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 50 }
  before_save   :set_tex

  private

    def set_tex
      self.tex = convert(self.body)
    end

    def convert(str)
      PandocRuby.convert(str, :from => :html, :to => :latex)
    end

    def convert2(str)
      PandocRuby.convert(str, :from => :latex, :to => :html5)
    end
end
