class Patient < ActiveRecord::Base

  resourcify

  validates_presence_of :title, :dob

  attachment :image, type: :image

  has_many :documents, dependent: :destroy

  accepts_attachments_for :documents

  belongs_to :user


end