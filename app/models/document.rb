class Document < ActiveRecord::Base
  belongs_to :patient

  attachment :file
end
