class AttachmentsController < ApplicationController
  def attachment_params
    params.require(:attachment).permit(:image)
  end
end
