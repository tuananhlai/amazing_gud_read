module ApplicationHelper
    def current?(key, path)
        puts key
        puts current_page?
        puts path
        "#{key}" if current_page? path
        # We use string interpolation "#{key}" here to access the CSS classes we are going to create.
     end

    def is_admin?
        session[:user_role] == "admin"
    end
end
