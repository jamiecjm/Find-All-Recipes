class Instruction < ApplicationRecord
	mount_uploader :step_photo, StepUploader
	belongs_to :recipe, optional: true

	before_save :titleize

    def titleize
    	if self.title.present?
     		self.title = self.title.titleize.delete(":")
     	end
    end
end
