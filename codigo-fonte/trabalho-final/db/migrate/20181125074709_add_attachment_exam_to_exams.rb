class AddAttachmentExamToExams < ActiveRecord::Migration[5.2]
  def self.up
    change_table :exams do |t|
      t.attachment :exam
    end
  end

  def self.down
    remove_attachment :exams, :exam
  end
end
