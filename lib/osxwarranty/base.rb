module OSXwarranty
	class Base
		# glarizza's get_warranty method (https://github.com/glarizza/scripts/blob/master/ruby/warranty.rb)
		def warranty(serial = nil)
			@serial = serial
			warranty_info = get_warranty_info(@serial)
			asdinfo = asdcheck(warranty_info[:model])
			warranty_info = warranty_info.merge({:asdinfo => asdinfo})
			return warranty_info
		end
		def get_warranty_info(serial)
			uri = "https://selfsolve.apple.com/wcResults.do"
			options = {:sn=>serial, :continue=>"Continue", :cn=>"", :locale=>"", :caller=>"", :num=>"0"}
			response = HTTPClient.post(uri,options)
			response_body = response.content
			repair_covered = response_body.split('warrantyPage.warrantycheck.displayHWSupportInfo').last.split('Repairs and Service Coverage: ')[1] =~ /^Active/ ? true : false
			expiration_date = response_body.split('Estimated Expiration Date: ')[1].split('<')[0] if repair_covered == true
			model = response_body.to_s.match(/warrantyPage\.warrantycheck\.displayProductInfo\(.*\)/).to_s.split(',')[1].gsub(/\'/,"").strip
			warranty_info = {:repair_covered => repair_covered, :expiration_date => expiration_date, :model => model}
			return warranty_info
		end

		# chilcote's asdcheck (https://github.com/chilcote/warranty/blob/master/asdcheck)
		def asdcheck(model)
		    asd_hash = Hash.new
			HTTPClient.get("https://raw.github.com/tevren/warranty/master/asdcheck").body.each_line do |line|
				asd_array = line.split(":")
				asd_hash[asd_array[0]] = asd_array[1].gsub("\n","")
		    end
		    return asd_hash[model]
		end
	end
end