module Motion
  class OCR
    def initialize(options={})
      options[:language] ||= "eng"
      @motion_ocr = MotionOCR.alloc.initWithOptions stringify(options)
    end

    def scan(image, options={})
      case options[:format]
      when :hocr then @motion_ocr.scanHOCR image
      else @motion_ocr.scan image
      end
    end

    private

    def stringify(hash)
      hash.with_indifferent_access.stringify_keys
    end
  end
end
