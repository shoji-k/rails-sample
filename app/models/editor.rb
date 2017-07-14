class Editor < ApplicationRecord
  attr_accessor :input_mode # 1: tex, 0: html
  validates :title,  presence: true, length: { maximum: 50 }
  before_save   :convert

  private

    def convert
      if input_mode.to_i == 1 then
        self.tex = html_to_tex(body)
      else
        self.body = tex_to_html(tex)
      end
    end

    def html_to_tex(str)
      PandocRuby.convert(str, :from => :html, :to => :latex)
    end

    def tex_to_html(str)
      PandocRuby.convert(str, :from => :latex, :to => :html5)
    end
end
