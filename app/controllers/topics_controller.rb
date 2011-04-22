class TopicsController < ApplicationController
  caches_page :index,:about,:protection
  def index
    set_seo_meta(t('title.news'),t('seo.keywords.news'),t('seo.describe.news'))
  end
  
  def about
    set_seo_meta(t('footer.aboutus'),t('seo.keywords.about'),t('seo.describe.about'))
  end
  
  def protection
    set_seo_meta(t('footer.copyright'))
  end
  
  def sitemap
    @books = Book.all
    @tags = Book.tag_counts_on(:keywords)
    render :layout => false
  end

end
