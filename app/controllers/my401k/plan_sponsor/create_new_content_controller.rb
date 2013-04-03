class My401k::PlanSponsor::CreateNewContentController < My401k::PlanSponsorController
  layout false

  before_filter :load_blog_categories, only: [:select_section]

  def index
    render layout: "my401k/plan_sponsor/create_new_content"
  end

  def select_section
    dts = Time.now.strftime("%Y-%m-%d-%H-%M-%S")
    section = Cms::Category.joins{category_type}.where{(self.name == "About Plan") & (category_type.name == "My401k Product")}.first
    @product = BcmsMy401k::Article.where{self.name == "New Article"}.first
    @product ||= BcmsMy401k::Article.create!(section: section, name: "New Article")
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

  private

  def load_blog_categories
    ctype = Cms::CategoryType.where{name == "My401k Product"}.first
    #categories = Cms::Category.where{category_type_id.in(my{ctype.id})}
    categories = Cms::Category.where{category_type_id.in(my{ctype.id})}.select{[id, name]}
    @product_categories = categories.inject({}){|a,b| a.merge({b.name => b.id})}
  end
end
