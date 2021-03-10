class Party < ApplicationRecord
    def self.order
        all_parties_dates = []
        array = self.all
        array.each do |party|
            all_parties_dates << party.date
        end
        sorted_dates = all_parties_dates.sort
        final_list = []
        sorted_dates.each do |d|
            final_list << self.find_by(date: d)
        end
        return final_list
    end
end
