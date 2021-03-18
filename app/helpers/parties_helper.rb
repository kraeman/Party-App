module PartiesHelper
    def parties_or_not(obj)
        if obj.empty?
            tag.h2 class: "empty list" do
                "There are no resources. GO CREATE ONE!"
            end
        else
            render obj
        end
    end
end
