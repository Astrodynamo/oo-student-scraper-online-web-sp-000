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
    profile = {}
    
    
    #social info scrape
    doc.css(".social-icon-container a").each do |icon|
      link = icon.attribute("href").value
      case
      when link.include?("twitter.com")
        profile[:twitter] = link
      when link.include?("linkedin.com")
        profile[:linkedin] = link
      when link.include?("github.com")
        profile[:github] = link
      when link.include?("learn.co")
        profile[:blog] = link
      end
    end
    
    #quote scrape
    profile[:profile_quote] = doc.css(".profile-quote").text
    
    #bio scrape
    profile[:bio] = doc.css(".bio-block p").text
    
    binding.pry
    profile
    
    #twitter
    #linkedin
    #github
    #blog
    #profile_quote
    #bio
  end

end

Scraper.scrape_profile_page("https://learn-co-curriculum.github.io/student-scraper-test-page/students/ryan-johnson.html")
