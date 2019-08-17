require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    profiles = []
    
    doc.css(".student-card").each do |card|
      student = {}
      student[:name] = card.css(".student-name").text
      student[:location] = card.css(".student-location").text
      student[:profile_url] = card.css("a").attribute("href").value
      profiles << student
    end
    profiles
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    
    
    #twitter
    #linkedin
    #github
    #blog
    #profile_quote
    #bio
  end

end

Scraper.scrape_index_page("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html")
