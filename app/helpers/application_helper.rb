module ApplicationHelper

	def intellinav
    
    nav = ''

    nav += "<nav class=\"top-bar\" data-topbar role=\"navigation\">"
      nav += "<ul class=\"title-area\">"
        nav += "<li class=\"name\">"
          nav += "<h1>"
          if @current_user.present? 
            nav += link_to('Whistle', user_path(@current_user))
          else 
            nav += link_to('Whistle', root_path)
          end
          nav += "</h1>"
        nav += "</li>"
        nav += "<li class=\"toggle-topbar menu-icon\"><a href=\"#\"><span></span></a></li>"
      nav += "</ul>"

    if @current_user.present?

        nav += "<section class=\"top-bar-section\">"
          nav += "<ul class=\"right\">"
            nav += "<li>" + link_to('Explore', users_path) + "</li>"

            nav += "<li>" + link_to('Following', tweets_path) + "</li>"

            nav += "<li class=\"has-dropdown\">"
              nav += "<a href=\"#\">Settings</a>"
              nav += "<ul class=\"dropdown\">"

                nav += "<li>" + link_to('View Profile', user_path(@current_user)) + "</li>"
                nav += "<li>" + link_to('Edit Profile', edit_user_path(@current_user)) + "</li>"
                nav += "<li>" + link_to('Sign Out', login_path, :method => :delete, :data => { :confirm => 'Are you sure?' }) + "</li>"

              nav += "</ul>"
            nav += "</li>"
          nav += "</ul>"
        nav += "</section>"
      nav += "</nav>"

    else
      nav += "<section class=\"top-bar-section\">"
        nav += "<ul class=\"right\">"
          nav += "<li>"
          nav += "<li>" + link_to('Explore', users_path) + "</li>"
          nav += "</li>"
          nav += "<li>"
          nav += "<a href=\"/login\">Log In</a>"
        nav += "</ul>"
      nav += "</section>"
    nav += "</nav>"

    end
    nav
  end
end
