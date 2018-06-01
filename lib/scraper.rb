require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    
    profiles = []
    
    page.css(".student-card").each do |profile|
      new_profile = {
        :name => profile.css(".student-name").text,
        :location => profile.css(".student-location").text,
        :profile_url => profile.css("a").attribute("href").value
        }
      profiles << new_profile
    end
    profiles
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
    social = page.css(".social-icon-container")
<<<<<<< HEAD
    profile = {}
    
    profile[:profile_quote] = page.css(".profile-quote").text
    profile[:bio] = page.css(".description-holder p").text
    
    counter = 0
    
    while counter < 8 do 
      
      link = social.css("a")[counter].attribute("href").value unless social.css("a")[counter] == nil
=======
    
    profile = {}
    
    counter = 0
    
    while counter < 8 do 
      link = social.css("a")[counter].attribute("href").value 
>>>>>>> aba5e1517bb608db43650f20bf2c4a99a84bfb4e
      
      if link.include?("twitter")
        profile[:twitter] = link
      elsif link.include?("linkedin")
        profile[:linkedin] = link
      elsif link.include?("github")
        profile[:github] = link
<<<<<<< HEAD
      elsif link
        profile[:blog] = link
      else
      end
  
=======
      else
        profile[:blog] = link
      end
      
>>>>>>> aba5e1517bb608db43650f20bf2c4a99a84bfb4e
      counter += 1
    end
    
    profile
  end
end

