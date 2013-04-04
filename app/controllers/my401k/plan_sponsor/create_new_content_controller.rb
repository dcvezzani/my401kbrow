class My401k::PlanSponsor::CreateNewContentController < My401k::PlanSponsorController
  include Cms::Acts::ContentPage

  layout false

  before_filter :load_product_categories, except: [:index, :preview_page]
  before_filter :load_product_layouts, except: [:index, :preview_page]
  before_filter :load_product, except: [:index, :preview_page]

  def index
    render layout: "my401k/plan_sponsor/create_new_content"
  end

  def select_section
  end

  def select_layout
  end

  def create_title_and_body
  end

  def create_tile
  end

  def optional_elections
  end

  def point_content
  end

  def preview_page
  end

  # def create_product
  #   @product = BcmsMy401k::Article.new(params[:product])

  #   respond_to do |format|
  #     if @product.save
  #       format.html { redirect_to @product, notice: 'Product was successfully created.' }
  #       format.json { render json: @product, status: :created, location: @product }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def update_product
  #   @product = BcmsMy401k::Article.find(params[:id])

  #   respond_to do |format|
  #     if @product.update_attributes(params[:product])
  #       format.html { redirect_to @product, notice: 'Product was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @product.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  # def next_product_id
  #   product = params[:product] # product: {id: 2, class_name: "BcmsBlog::BlogPost"}
  #   klass = product[:class_name].constantize
  #   sequence_name = klass.sequence_name
  #   if(klass.name == "BcmsBlog::BlogPost")
  #     next_id = klass.find_by_sql("SELECT nextval('#{sequence_name}') AS next_id").first
  #   end

  #   respond_to do |format|
  #     format.json { render json: next_id, status: :success }
  #   end
  # end

  protected

  # def build_block
  #   super
  #   ensure_blog_editable
  #   @block.author = current_user
  # end

  # def load_block
  #   super
  #   ensure_blog_editable
  # end

  # def load_blocks
  #   super
  #   @blocks.delete_if { |b| !b.editable_by?(current_user) }
  # end
 
  # def build_block
  #   super
  #   @product = @block
  # end

  # def load_block
  #   super
  #   @product = @block
  # end

  # def load_blocks
  #   super
  #   @product = @block
  # end
  
  private

  def load_product_categories
    ctype = Cms::CategoryType.where{name == "My401k Product"}.first
    #categories = Cms::Category.where{category_type_id.in(my{ctype.id})}
    categories = Cms::Category.where{category_type_id.in(my{ctype.id})}.select{[id, name]}
    @product_categories = categories.inject({}){|a,b| a.merge({b.name => b.id})}
  end

  def load_product_layouts
    @product_layouts = BcmsMy401k::Layout.all
  end

  def load_block_draft
    model_class = BcmsMy401k::Article
    @block = model_class.find(params[:id])
    @block = @block.as_of_draft_version if model_class.versioned?
    #check_permissions
    @product = @block
  end

  # Use a "whitelist" approach to access to avoid mistakes
  # By default everyone can create new block and view them and their properties,
  # but blocks can only be modified based on the permissions of the pages they
  # are connected to.
  def check_permissions
    raise Cms::Errors::AccessDenied unless current_user.able_to_edit?(@block)
    
    # case action_name
    #   when "index", "show", "new", "create", "version", "versions", "usages"
    #     # Allow
    #   when "edit", "update"
    #     raise Cms::Errors::AccessDenied unless current_user.able_to_edit?(@block)
    #   when "destroy", "publish", "revert_to"
    #     raise Cms::Errors::AccessDenied unless current_user.able_to_publish?(@block)
    #   else
    #     raise Cms::Errors::AccessDenied
    # end
  end
  
  def load_product
    if(params[:id])
      load_block_draft

    else
      #dts = Time.now.strftime("%Y-%m-%d-%H-%M-%S")
      the_layout = BcmsMy401k::Layout.where{self.name == "Layout 2"}.first
      section = Cms::Category.joins{category_type}.where{(self.name == "About Plan") & (category_type.name == "My401k Product")}.first
      product = BcmsMy401k::Article.where{self.name == "New Article"}.first
      product ||= BcmsMy401k::Article.create!(section: section, name: "New Article", layout: the_layout)

      @product = product.as_of_draft_version
    end
  end
end
