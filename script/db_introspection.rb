class DbIntrospection
  def initialize(report_file_name = nil)
    tds = Time.now.strftime("%Y%m%d%H%M%S");
    report_file_name = File.expand_path("./db-introspection-report-#{tds}.txt")
    @file_name = report_file_name;
  end

  def inspect(*klasses)
    File.open(@file_name, "w") do |f|
      
      klasses.each do |k|
        attr_accessibles = k.accessible_attributes.entries

        if(k.ancestors.include?(ActiveRecord::Base))
          f.write(k)
          f.write("\n")
          f.write("==========================\n")
          f.write(k.table_name)
          f.write("\n")
          f.write(k.sequence_name)
          f.write("\n")
          f.write("--------------------------\n")
            f.write("=== attributes :".rjust(27) + " ==" + " ".ljust(19) + "Accessible?\n")
          f.write(k.columns.select{|c| !c.name.match(/_id$/)}.sort{|a,b| (a.name == 'id') ? -1 : a.name <=> b.name}.map{|c| 
            trailer_char = attr_accessibles.include?(c.name) ? "." : " "
            accessible_marker = attr_accessibles.include?(c.name) ? " X" : ""
            "#{c.name.rjust(25)} : #{c.type.to_s.ljust(25, trailer_char)}#{accessible_marker}"
          }.join("\n"))
          f.write("\n\n")
            f.write("=== foreign keys? :".rjust(27) + " ==\n")
          f.write(k.columns.select{|c| c.name.match(/_id$/)}.sort{|a,b| a.name <=> b.name}.map{|c| 
            trailer_char = attr_accessibles.include?(c.name) ? "." : " "
            accessible_marker = attr_accessibles.include?(c.name) ? " X" : ""
            "#{c.name.rjust(25)} : #{c.type.to_s.ljust(25, trailer_char)}#{accessible_marker}"
          }.join("\n"))
          f.write("\n\n")
          
          # accessible_attributes = k.accessible_attributes.entries.sort
          # accessible_attributes.shift
          # accessible_attributes = accessible_attributes.map{|a| ":#{a}"}.join(", ")
          # #accessible_attributes = k.accessible_attributes.entries.sort.map{|a| "#{' '.rjust(26)}:#{a}".to_s.ljust(25)}.join("\n")
          # if(accessible_attributes.length > 0)
          #   f.write("=== attr_accessible :".rjust(27) + " ==\n")
          #   f.write(accessible_attributes) 
          #   f.write("\n\n")
          # end

          associations = k.reflect_on_all_associations.map{|a| 
            association_options = (a.options.length > 0) ? "#{a.options.map{|k,v| "#{k}: \"#{v}\""}.join(", ")}" : ""
            "#{a.macro.to_s.rjust(25)} : #{a.name.to_s.ljust(25)}#{association_options}"
          }.sort.join("\n")

          if(associations.length > 0)
            f.write("=== associations :".rjust(27) + " ==\n")
            f.write(associations)
            f.write("\n\n")
          end

          scoped_methods = k.singleton_methods(false).select{|x| 
            m = k.method(x)
            m.source_location.first.match(/lib\/active_record\/scoping\/named.rb$/)
          }
          
          scoped_methods = scoped_methods.map{|s|
            "#{''.rjust(25)} : #{s.to_s.ljust(25)}"
          }.sort.join("\n")

          if(scoped_methods.length > 0)
            f.write("=== scoped methods :".rjust(27) + " ==\n")
            f.write(scoped_methods)
            f.write("\n\n")
          end

          validators = k._validators.map{|k,v| 
            val = "#{v.first.class.kind} (#{v.first.class.name})"
            "#{k.to_s.rjust(25)} : #{val.to_s.ljust(25)}"
          }.sort.join("\n")

          if(validators.length > 0)
            f.write("=== validators :".rjust(27) + " ==\n")
            f.write(validators)
            f.write("\n\n")
          end

          f.write("\n")
        else
        end
      end
    end
  end

  def self.inspect(*klasses)
    dbi = DbIntrospection.new 
    dbi.inspect *klasses
  end
end

# e.g., 
# dbi = DbIntrospection.new 
# dbi.inspect Advertiser::Opportunity

=begin
cd <rails-root>
find app/models -exec grep "^class " {} \;
=end

puts "\n======================================
Usage: 
  dbi = DbIntrospection.new 
  dbi.inspect Advertiser::Opportunity

or

Usage: 
  DbIntrospection.inspect( Admin::Note, Admin::Tool, Admin::ToolNote, Admin::ViewScenario, Admin::ViewScenarioNote, Admin::ViewToolNote, Advertiser::ListingRange, Advertiser::ListingRanking, Advertiser::ListingSlot, Advertiser::Opportunity, Advertiser::Price, Advertiser::RankingPrice, Advertiser::ShoppingCartItem, Advertiser::ShoppingCartRanking, Category, CategoryAssignment, ContactInfo, EmailAddress, FaxNumber, FormalProposal, Image, Listing, ListingAudience, ListingAudienceAssignment, ListingBanner, ListingBannerImage, ListingCategory, ListingCategoryAssignment, ListingContactDetail, ListingDetail, ListingImage, ListingLogo, ListingLogoImage, ListingMenu, ListingMenuItem, ListingSample, ListingSummary, ListingTag, ListingTagAssignment, LogoImage, PhoneNumber, ProviderOrganization, User, UserLogoImage, Webpage )


Gather current models (in bash shell):
find app/models -exec grep \"class \" {} \\\;
grep -rl \"^\\s*class \" app/models
grep -r \"class [^ ]\\+ < ActiveRecord::Base\" app/models

Paste into vim window and run substitution commands: 
:%s/class //g
:%s/ <.\\\+/, /g
======================================"
