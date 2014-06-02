class CourseItem < ActiveRecord::Base
  #has_attached_file :audio, :url => "/files/:class/:attachment/:basename.:extension"
  alias_attribute :english, :question
  alias_attribute :translation, :answer
  base_path = "/files/audio/"

  attr_accessor :delete_audio
  attr_accessible :answer, :course_id, :question, :audio, :delete_audio, :filename, :day
  belongs_to :course

  def self.file_path
    '/files/audio/'
  end

  def file_path
    #'/files/audio/' + self.filename + '.m4a'
    '/files/audio/' + self.filename
  end

end
