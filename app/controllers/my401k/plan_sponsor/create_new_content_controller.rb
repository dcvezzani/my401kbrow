class My401k::PlanSponsor::CreateNewContentController < My401k::PlanSponsorController
  layout false

  before_filter :load_blog_categories, only: [:select_section]

  def index
    render layout: "my401k/plan_sponsor/create_new_content"
  end

  def select_section
    dts = Time.now.strftime("%Y-%m-%d-%H-%M-%S")
    category = Cms::Category.joins{category_type}.where{(self.name == "About Plan") & (category_type.name == "Article")}.first
    @product = BcmsMy401k::Article.new(section: category, name: "New Article")
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

  def update_page
    @product = BcmsMy401k::Article.find(params[:id])
  end

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
    ctype = Cms::CategoryType.where{name == "Blog Post"}.first
    #categories = Cms::Category.where{category_type_id.in(my{ctype.id})}
    categories = Cms::Category.where{category_type_id.in(my{ctype.id})}.select{[id, name]}
    @product_categories = categories.inject({}){|a,b| a.merge({b.name => b.id})}
  end
end
