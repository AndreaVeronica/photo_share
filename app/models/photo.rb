class Photo < ActiveRecord::Base
   validates :title, presence: true
   validates :description, presence: true


   belongs_to :user

  # before_save :default_values

  # private

  # def default_values
  #   self.completed ||= false
  #   nil                           # required so that TX will not rollback!!!
  # end


has_attached_file :image, styles: {large: "1000x1000>", medium: "600x600>", thumb: "150x150>"}

validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
