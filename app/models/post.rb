class Post < ActiveRecord::Base
  belongs_to :user

  before_save :set_default_author

  scope :ordered, -> { order("publish_at desc") }
  scope :published, -> { where("publish_at is NOT NULL and publish_at < ?", Time.now) }

  has_attached_file :cover, :styles => {:thumb => "200x76#", :cover => "1000x382#"},
                            :url => "/ckeditor_assets/post/:id/:style/:filename",
                            :path => ":rails_root/public/ckeditor_assets/post/:id/:style/:filename"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  attr_accessor :delete_cover
  before_validation { self.cover = nil if self.delete_cover == '1' }


  protected
  def published?
    !!publish_at
  end

  def set_default_author
    self.author ||= user.try(:display_name)
  end

  rails_admin do
    weight 20
    list do
      filters [:title, :publish_at]
      field :id
      field :title
      field :subtitle
      field :author
      field :publish_at
      field :updated_at
    end

    edit do
      field :title do
        required true
      end
      field :subtitle
      field :author do
         help "显示的作者名，如果不填，使用当前发布用户的显示名"
      end
      field :cover do
        # for images. Will default to full size image, which might break the layout
        thumb_method :thumb
        # actually not needed in this case: default is "delete_#{field_name}" if the object responds to it
        delete_method :delete_cover
      end
      field :publish_at, :datetime do
        help "可设置预约发布时间；如果不填表示不发布"
        strftime_format "%Y-%m-%d %H:%M"
      end

      field :abstract, :ck_editor do
        required true
      end
      field :content, :ck_editor do
        required true
      end

    end

  end
end
