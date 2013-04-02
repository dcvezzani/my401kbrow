require 'digest/sha1'

module Cms
  class Site < ActiveRecord::Base

    attr_accessible :name, :domain, :path, :identifier, :locale

    # -- Relationships --------------------------------------------------------
    with_options :dependent => :destroy do |site|
      # site.has_many :layouts
      site.has_many :pages
      # site.has_many :snippets
      # site.has_many :files
      # site.has_many :categories
    end

    validates_uniqueness_of :path
    #validates_presence_of :locale, :identifier, :domain

    before_validation :remove_www

    # get some kind of infinite loop when trying to modify and save a column
    # when this is uncommented:
    #
    # before_save :unset_default
    # after_save :set_default

    scope :default, :conditions => {:the_default => true}

    def self.find_by_domain(domain)
      d = domain.clone
      strip_www!(d)
      if site = first(:conditions => {:domain => d})
        site
      else
        default.first
      end
    end

    def self.strip_www!(d)
      return unless d
      d.sub!(/\Awww./, '')
    end

    def remove_www
      self.class.strip_www!(domain)
    end

    def unset_default
      self.class.update_all(["the_default = ?", false]) if the_default
    end

    def set_default
      if self.class.default.count < 1
        update_attribute(:the_default, true)
      end
    end

    def self.extract_site_indicator!(path)
      md = path.match(/^([^\/]+)\/(.+)/)
      site_indicator = md[1]
      path = md[2]
    end


    # -- Class Methods --------------------------------------------------------
    # returning the Cms::Site instance based on host and path
    def self.find_site(host, path = nil)
      return Site.first if Site.count == 1
      cms_site = nil
      
      Site.find_all_by_domain(real_host_from_aliases(host)).each do |site|
        #if "#{path}/".match /^\/#{Regexp.escape(site.path.to_s)}\//
        debugger
        if (path and site.path) and "#{path}/".match /^#{Regexp.escape(site.path.to_s)}/
          cms_site = site
          break
        end
      end
      
      return (cms_site or Site.where{sites.path == nil}.first)
    end
    
protected
  
    def self.real_host_from_aliases(host)

      # disable until this feature is available
      # code came from ComfortableMexicanSofa
      # can create equivalent of a configuration class for BrowserCms
      #
      if false and aliases = ComfortableMexicanSofa.config.hostname_aliases
        aliases.each do |alias_host, aliases|
          return alias_host if aliases.include?(host)
        end
      end
      strip_www!(host)
      host
    end
  end
end
