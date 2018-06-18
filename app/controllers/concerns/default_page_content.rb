module DefaultPageContent
  extend ActiveSupport::Concern

  #Updates title for page based on page on using instance variables
  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "DevPortfolio | My Website"
    @seo_keywords = "Matt Vroom portfolio"
  end

end
