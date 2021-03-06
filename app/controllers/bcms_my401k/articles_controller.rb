class BcmsMy401k::ArticlesController < Cms::ContentBlockController

  def update
    Rails.logger.debug(">>>>>>>>>>>:")
    super
  end
  
  # TODO: this does work, but there may be ill consequences using it
  # only deviate from the normal if :update_draft flag is in params
  alias_method :load_block_orig, :load_block
  def load_block
    if(params[:update_draft])
      load_block_draft
    else
      load_block_orig
    end
  end
  
  # just return json to provide insight of what took place
  # let JavaScript decide what will be rendered next
  def after_create_on_success
    block = @block.class.versioned? ? @block.draft : @block
    flash[:notice] = "#{content_type.display_name} '#{block.name}' was created"

    # if @block.class.connectable? && @block.connected_page
    #   redirect_to @block.connected_page.path
    # else
    #   redirect_to_first params[:_redirect_to], block_path(@block)
    # end
    render json: @block, status: :accepted, location: block_path(@block)
  end

  def after_create_on_failure
    render "#{template_directory}/new"
  end


  # just return json to provide insight of what took place
  # let JavaScript decide what will be rendered next
  def after_update_on_success
    flash[:notice] = "#{content_type_name.demodulize.titleize} '#{@block.name}' was updated"

    #redirect_to_first params[:_redirect_to], block_path(@block)
    render json: @block, status: :accepted, location: block_path(@block)
  end

  def after_update_on_failure
    render "#{template_directory}/edit"
  end
end
