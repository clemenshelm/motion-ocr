module Motion
  class OCR
    def initialize(options={})
      options[:language] ||= "eng"
      options = stringify(options)
      @tesseract = Tesseract.alloc.initWithLanguage options[:english]
    end

    def scan(image, options={})
      @tesseract.setImage(image)

      case options[:format]
      when :hocr then @tesseract.recognizedText
      else @motion_ocr.recognizedHOCR
      end
    end

    private

    def stringify(hash)
      stringified = hash.flatten.map(&:to_s)
      Hash[*stringified]
    end
  end
end
