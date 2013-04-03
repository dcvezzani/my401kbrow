class BcmsMy401k::ArticlesController < Cms::ContentBlockController
  def after_create_on_success
    block = @block.class.versioned? ? @block.draft : @block
    flash[:notice] = "#{content_type.display_name} '#{block.name}' was created"
    if @block.class.connectable? && @block.connected_page
      redirect_to @block.connected_page.path
    else
      redirect_to_first params[:_redirect_to], block_path(@block)
    end
  end

  def after_create_on_failure
    render "#{template_directory}/new"
  end


  def after_update_on_success
    flash[:notice] = "#{content_type_name.demodulize.titleize} '#{@block.name}' was updated"
    redirect_to_first params[:_redirect_to], block_path(@block)
  end

  def after_update_on_failure
    render "#{template_directory}/edit"
  end
end
