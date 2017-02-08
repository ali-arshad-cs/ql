class Post < ActiveRecord::Base

  resourcify

  validates_presence_of :date, :qc_done

  attachment :image, type: :image

  has_many :documents, dependent: :destroy

  accepts_attachments_for :documents

  belongs_to :user


end