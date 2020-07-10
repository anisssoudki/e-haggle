module ApplicationHelper

        def color(level)
            case level
            when :notice then "blue"
            when :success then "green"
            when :error then "redr"
            when :alert then "yellow"
               
        end
    end
end