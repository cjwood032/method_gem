class MethodGem::Scraper

    def scrape_page(type)
        @main=Nokogiri::HTML(open("https://ruby-doc.org/core-2.5.3/#{type}.html"))
    end
    def get_names
        @names = @main.css(".wrapper").css(".method-callseq").map {|e| e.children.text.split[0]}.uniq.map{|n| n.split('(')[0]}
    end
    def get_def(num)
        o[num].text.split.join(' ')
    end
    def get_description
        @desc=@main.css(".wrapper").css("#description").text
    end
end
everything=@main.css(".wrapper").text.split
i=everything.find_index("Public")
if everything[i+1]=="Class" && everything[i+2]=="Method"
    cut=everything.drop(i+3)
end
#have a loop over ther entirety
# find the click to toggle 
# everything before the click to toggle will be the name
#everything after up to a point will be the description