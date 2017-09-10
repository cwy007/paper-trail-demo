class VersionsController < ApplicationController
  def revert
    @version = PaperTrail::Version.find(params[:id])
    if @version.reify
      @version.reify.save!
    else
      @version.item.destroy
    end 
    flash[:notice] = "Undid #{@version.event}"
    redirect_back(fallback_location: root_path)
  end
end
