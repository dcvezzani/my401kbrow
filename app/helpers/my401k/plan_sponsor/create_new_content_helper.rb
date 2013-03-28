module My401k::PlanSponsor::CreateNewContentHelper
  def product_route(product)
    if(product.is_a?(BcmsBlog::BlogPost))
      bcms_blog.blog_posts_path
    end
  end
end
