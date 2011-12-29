class Attachment  
  include MongoMapper::EmbeddedDocument

  key :title, String
  embedded_in :attachable
  key :attachment_uid, String
  key :attachment_basename, String
  key :attachment_format, String
  image_accessor :attachment do
    storage_opts do |a| 
      opts = { 
        :path => 
          "/#{attachable.class.to_s.downcase}/#{id}/#{Time.now.to_i}_#{attachment_basename}"
      }
      opts
    end
  end

  def image?
    %w(gif png jpg jpeg bmp tif tiff).include? attachment_format
  end
  def large_url
    url(:large)
  end
  def medium_url
    url(:medium)
  end
  def small_url
    url(:small)
  end
  def url(size = :large)
    return "" unless attachment?
    attachment.__send__(size).url
  end
  def attachment_basename=(string)
    super(string.parameterize)
  end
  def attachment?
    !attachment_uid.nil?
  end
end
