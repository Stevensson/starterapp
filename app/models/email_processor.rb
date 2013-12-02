class EmailProcessor
  
  def self.process(email)
    new(email).process
  end

  def initialize(email)
    @email = email
  end

  def process
    create_post
  end

  private
  attr_accessor :title

  def create_post
    Post.create(title: email.from, body: sanitized_body)
  end

  def sanitized_body
    Sanitize.clean(email.body, Sanitize::Config::BASIC)
  end
end