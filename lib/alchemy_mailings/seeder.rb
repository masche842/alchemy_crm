module AlchemyMailings
	class Seeder
		
		def self.seed!
			puts "Seeding database for Alchemy Mailing Module"
			root = Page.root
			lang = Language.get_default
	    if root.nil? || lang.nil?
				puts "== Aborting! Not all dependencies found. Did you ran the Alchemy seeder?"
			else
	      mailing_root = Page.find_or_create_by_name(
					:name => "Alchemy Mailings Rootpage",
					:page_layout => 'alchemy_mailings_rootpage',
	        :do_not_autogenerate => true,
	        :do_not_sweep => true,
	        :language => lang
				)
				if mailing_root.new_record?
					mailing_root.save!
	      	mailing_root.move_to_child_of root
					puts "== Success! Mailing root page created"
				else
					puts "== Skipping! Already created mailing root page."
				end
	    end
		end
		
	end
end
