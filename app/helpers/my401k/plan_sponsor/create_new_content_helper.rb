module My401k::PlanSponsor::CreateNewContentHelper
  def product_route(product)
    if(product.is_a?(BcmsBlog::BlogPost))
      bcms_blog.blog_posts_path
    elsif(product.is_a?(BcmsMy401k::Article))
      bcms_my401k.articles_path
    end
  end
end
