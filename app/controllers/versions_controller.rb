class VersionsController < ApplicationController
  def index
    @versions = PaperTrail::Version.order("id DESC").page(params[:page])
  end

  def revert
    @version = PaperTrail::Version.find(params[:id])
    if @version.reify
      @version.reify.save!
    else
      @version.item.destroy
    end
    link_name = (params[:redo] == "true" ? "undo" : "redo")
    link = view_context.link_to(link_name, revert_version_path(@version.next, :redo => params[:redo]=="true" ? false : true), method: :post)
    flash[:notice] = "Undid #{@version.event} #{link}"
    redirect_back(fallback_location: root_path)
  end

  def bulk_delete
    PaperTrail::Version.delete_all
    flash[:notice] = "deleted all versions successfully"
    redirect_back(fallback_location: root_path)
  end

end
