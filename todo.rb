class Task
  attr_reader :title, :description, :status, :created_at

  def initialize(title, description)
    @title = title
    @description = description
    @status = "incomplete"
    @created_at = Time.now
  end
end
