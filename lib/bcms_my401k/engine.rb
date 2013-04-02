require 'browsercms'

module BcmsMy401k
  class Engine < ::Rails::Engine
		include Cms::Module
    isolate_namespace BcmsMy401k

    config.to_prepare do
      #%W{ArticleProduct Article BlogPost HeadlineBanner}.each do |resource|
      %W{Article Layout}.each do |resource|
        Cms::ViewContext.send(:include, BcmsMy401k.module_eval("#{resource.pluralize}Helper"))
        ApplicationHelper.send(:include, BcmsMy401k.module_eval("#{resource.pluralize}Helper"))
      end
    end

    initializer 'bcms_my401k.route_extensions', :after => 'action_dispatch.prepare_dispatcher' do |app|
       ActionDispatch::Routing::Mapper.send :include, BcmsMy401k::RouteExtensions
    end
  end
end
