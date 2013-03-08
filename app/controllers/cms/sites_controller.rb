class Cms::SitesController < ApplicationController
  # GET /cms/sites
  # GET /cms/sites.json
  def index
    @cms_sites = Cms::Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cms_sites }
    end
  end

  # GET /cms/sites/1
  # GET /cms/sites/1.json
  def show
    @cms_site = Cms::Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cms_site }
    end
  end

  # GET /cms/sites/new
  # GET /cms/sites/new.json
  def new
    @cms_site = Cms::Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cms_site }
    end
  end

  # GET /cms/sites/1/edit
  def edit
    @cms_site = Cms::Site.find(params[:id])
  end

  # POST /cms/sites
  # POST /cms/sites.json
  def create
    @cms_site = Cms::Site.new(params[:cms_site])

    respond_to do |format|
      if @cms_site.save
        format.html { redirect_to @cms_site, notice: 'Site was successfully created.' }
        format.json { render json: @cms_site, status: :created, location: @cms_site }
      else
        format.html { render action: "new" }
        format.json { render json: @cms_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cms/sites/1
  # PUT /cms/sites/1.json
  def update
    @cms_site = Cms::Site.find(params[:id])

    respond_to do |format|
      if @cms_site.update_attributes(params[:cms_site])
        format.html { redirect_to @cms_site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cms_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cms/sites/1
  # DELETE /cms/sites/1.json
  def destroy
    @cms_site = Cms::Site.find(params[:id])
    @cms_site.destroy

    respond_to do |format|
      format.html { redirect_to cms_sites_url }
      format.json { head :no_content }
    end
  end
end
