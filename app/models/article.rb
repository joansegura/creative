class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 1 }

    has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

    has_attached_file :photo
  # Validate content type
  validates_attachment_content_type :photo, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :photo, matches: [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :photo

end


