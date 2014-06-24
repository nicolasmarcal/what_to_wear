class App::SessionsController < App::AppController

  skip_before_filter :set_logged_person, :only => [:create]

  def create
    @person = Person.find_or_create_person(request.env["omniauth.auth"])

    session[:person_id] = @person.id.to_s

    redirect_to app_person_dashboard_path(@person)
  end
end