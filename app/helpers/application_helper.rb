module ApplicationHelper
  def full_title page_title = ""
    base_title = t "helpers.application_helper.rails_tut_sample_app"
    page_title ? (page_title + " | " + base_title) : base_title
  end
end
