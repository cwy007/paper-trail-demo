class VersionsController < ApplicationController
  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_back(fallback_location: root_path), notice: "Undid #{@version.event}"
  end 
end
