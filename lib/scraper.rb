require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    cards  = doc.css(".student-card")
    binding.pry
    profiles = {}
    
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

scrape_index_page("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html")