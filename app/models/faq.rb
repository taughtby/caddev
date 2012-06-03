class Faq < ActiveRecord::Base
  attr_accessible :answer, :question, :tutor_id
  belongs_to :tutor
end
