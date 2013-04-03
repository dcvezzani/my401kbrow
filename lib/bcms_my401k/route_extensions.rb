module BcmsMy401k::RouteExtensions
  def mount_bcms_my401k
    #mount BcmsMy401k::Engine => "/bcms_my401k"
    mount BcmsMy401k::Engine, at: "/bcms_my401k/abc"
    #match '/blog/feeds', :to=>"bcms_blog/feeds#index", :defaults=>{:format => "rss"}, :as=>'blog_feeds'
  end
  
  alias :routes_for_bcms_my401k :mount_bcms_my401k
end

