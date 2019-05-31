class Hank < ApplicationRecord

    has_one_attached :image

    def self.to_csv(fields = column_names, options = {}) 
        CSV.generate(options) do |csv|
            csv << fields
            all.each do |hank|
                csv << hank.attributes.values_at(*fields)
            end
        end
    end

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            hank_hash = row.to_hash
            hank = find_or_create_by!(name: hank_hash['name'], cod_anchor: hank_hash['cod_anchor'], cod_anchor: hank_hash['cod_dmc'] , cod_maxi: hank_hash['cod_maxi'])
            hank.update_attributes(hank_hash)
        end
    end

    def self.search_by_name(search_term)
        where("name LIKE ?", "%#{search_term}%")        
    end
    def self.search_by_cod_anchor(search_term)
        where("cod_anchor LIKE ?", "%#{search_term}%")        
    end
    def self.search_by_cod_dmc(search_term)
        where("cod_dmc LIKE ?", "%#{search_term}%")        
    end
    def self.search_by_cod_maxi(search_term)
        where("cod_maxi LIKE ?", "%#{search_term}%")        
    end



end
