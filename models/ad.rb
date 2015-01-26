class Ad < ActiveRecord::Base
  attr_accessible :content, :weight, :link, :counter, :location
  has_many :click_records


  def self.select_ad(location)
    #total_weight = self.where("location = ?", location).select("id, sum(weight) as total_weight").first.total_weight
    total_weight = 100
    ads = self.where("location = ?", location).all
    return nil if ads.length == 0
    return ads.first if ads.length == 1
    ads.each do |ad|
      #chance = ((ad.weight / total_weight).to_f * 100).to_i
      chance = ad.weight.to_i
      hit = rand(0..100)
      if hit <= chance
        return ad
      end
    end
    return ads.first
  end

  def link_tag
    ActionController::Base.helpers.link_to self.content.html_safe, Rails.application.routes.url_helpers.portal_path(self.id), :target => '_blank'
  end

  def self.blank
    self.new(:content => '', :link => '', :location => -1)
  end

  def click_count
    self.click_records.all.length
  end

  def self.top_l
    self.select_ad("top_l")
  end

  def self.signup
    self.select_ad("signup")
  end

  def self.signin
    self.select_ad("signin")
    
  end
  
  def self.top_r
    self.select_ad("top_r")
    
  end

  def self.left
    self.select_ad("left")
    
  end

  def self.right
    self.select_ad("right")
    
  end


  
end
