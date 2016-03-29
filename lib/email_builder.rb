class EmailBuilder
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
  WHITESPACE = /\s+/
  DELIMITERS = /[\n,;]+/

  def initialize(attributes)
    @recipients = attributes[:recipients] || ''
  end

  def invalid_recipients
    recipient_list.map do |item|
      unless item.match(EMAIL_REGEX)
        item
      end
    end.compact
  end

  def recipient_list
    @recipients.gsub(WHITESPACE, '').split(DELIMITERS)
  end

  def valid_recipients?
    invalid_recipients.empty?
  end

end