require 'nokogiri'
require 'open-uri'
class StaticPagesController < ApplicationController
  def frontpage
    url = "http://news.yahoo.com/comics"
    doc = Nokogiri::HTML(open(url))
    array = []

    doc.css("li.comic-item").each do |item|
      array << item.at_css(".comic-image").children.at_css('img').attr('src')
    end

    redirect_to array.sample
  end
end
