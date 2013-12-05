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
  attr_accessor :email

  def create_post
    Post.create(title: email.from, body: email.body)
  end

  def sanitized_body
    Sanitize.clean(email.body, Sanitize::Config::BASIC)
  end
end