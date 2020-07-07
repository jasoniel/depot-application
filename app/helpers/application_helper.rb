module ApplicationHelper
    def render_if(condition, content)
        if condition
            render content
        end
    end
end
