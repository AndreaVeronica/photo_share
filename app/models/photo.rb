class Photo < ActiveRecord::Base
   validates :title, presence: true
   validates :description, presence: true
   validates :photo_url, presence: true

   belongs_to :user

  # before_save :default_values

  # private

  # def default_values
  #   self.completed ||= false
  #   nil                           # required so that TX will not rollback!!!
  # end
end
