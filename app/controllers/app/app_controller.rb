class App::AppController < ApplicationController
  before_filter :set_logged_person

  protected

  def set_logged_person
    @logged_person ||= Person.find(session[:person_id])
  end
end