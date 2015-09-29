class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
 
   has_attached_file :photo,
                  :url  => "/assets/articles/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

end