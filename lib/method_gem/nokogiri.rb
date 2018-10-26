class MethodGem::Scraper

    def scrape_page(type)
        @main=Nokogiri::HTML(open("https://ruby-doc.org/core-2.5.3/#{url}.html"))
    end
    def get names
        @names = @main.css(".wrapper").css(".method-callseq").map {|e| e.children.text.split[0]}.uniq.map{|n| n.split('(')[0]}
    end
end
