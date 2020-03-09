class Exam < ApplicationRecord
  has_attached_file :exam, :styles => { :medium => "400x400>", :thumb => "120x90#", :grande => "600x700>" }
  validates_attachment_content_type :exam, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/pdf"]
  belongs_to :patient
end
