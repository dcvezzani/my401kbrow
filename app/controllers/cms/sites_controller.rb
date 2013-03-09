module Cms
class SitesController < Cms::ResourceController
  layout 'cms/administration'
  
  check_permissions :administrate
  before_filter :set_menu_section

  
  # GET /cms/sites
  # GET /cms/sites.json
  def index
    per_page = params[:per_page] || 10

    #@cms_sites = Site.all
    #@users = User.paginate(:page => params[:page], :per_page => per_page, :conditions => conditions, :order => "name")
    @cms_sites = Site.paginate(
      :page => params[:page], 
      :per_page => per_page)
  end


  # # GET /cms/sites/1
  # # GET /cms/sites/1.json
  # def show
  #   @cms_site = Site.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @cms_site }
  #   end
  # end

  # GET /cms/sites/new
  # GET /cms/sites/new.json
  def new
    @cms_site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_site }
    end
  end

  # GET /cms/sites/1/edit
  def edit
    @cms_site = Site.find(params[:id])
  end

  # # POST /cms/sites
  # # POST /cms/sites.json
  # def create
  #   @cms_site = Site.new(params[:cms_site])

  #   respond_to do |format|
  #     if @cms_site.save
  #       format.html { redirect_to @cms_site, notice: 'Site was successfully created.' }
  #       format.json { render json: @cms_site, status: :created, location: @cms_site }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @cms_site.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /cms/sites/1
  # # PUT /cms/sites/1.json
  # def update
  #   @cms_site = Site.find(params[:id])

  #   respond_to do |format|
  #     if @cms_site.update_attributes(params[:cms_site])
  #       format.html { redirect_to @cms_site, notice: 'Site was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @cms_site.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /cms/sites/1
  # # DELETE /cms/sites/1.json
  # def destroy
  #   @cms_site = Site.find(params[:id])
  #   @cms_site.destroy

  #   respond_to do |format|
  #     format.html { redirect_to cms_sites_url }
  #     format.json { head :no_content }
  #   end
  # end

  protected
    def after_create_url
      index_url
    end
    def after_update_url
      index_url
    end

    def set_menu_section
      @menu_section = 'sites'
    end

  # private
  #   def cms_site
  #     @cms_site ||= Site.find(params[:id])
  #   end
  #   def set_menu_section
  #     @menu_section = 'sites'
  #   end
  #   
  #   def only_self_or_administrator
  #     raise Cms::Errors::AccessDenied if !current_user.able_to?(:administrate) && params[:id].to_i != current_user.id
  #   end
end
end
