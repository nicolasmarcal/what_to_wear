class App::SessionsController < App::AppController

  skip_before_filter :set_logged_user, :only => [:create]

  def create
    @person = Person.find_or_create_person(request.env["omniauth.auth"])

    session[:person_id] = @person.id.to_s
  end
end