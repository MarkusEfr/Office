class AttachmentUploader < CarrierWave::Uploader::Base
   storage :file
   
   def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
   end
   
   def extension_white_list
      %w(pdf doc htm html docx)
   end
def size_range
    0..12200.kilobytes
  end

  private

  def check_size!(new_file)
    size = new_file.size
    expected_size_range = size_range
    if expected_size_range.is_a?(::Range)
      if size < expected_size_range.min
        raise CarrierWave::IntegrityError, I18n.translate(:"errors.messages.min_size_error", :min_size => ApplicationController.helpers.number_to_human_size(expected_size_range.min))
      elsif size > expected_size_range.max
        raise CarrierWave::IntegrityError, I18n.translate(:"errors.messages.max_size_error", :max_size => ApplicationController.helpers.number_to_human_size(expected_size_range.max))
      end
    end
  end
end
