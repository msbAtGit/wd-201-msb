#A ruby program that renders HTML document to the console

node1 = {
    :tag=> "p",
    :text => "This is the paragraph",  
}

h1 = {
    :tag=> "h1",
    :text => "This is a Large heading",  
}


html = {
    :tag=> "div",
    :children => [node1, h1],
    :text => "This is the paragraph",  
}





def render (node)
    if node == nil
        return
    elsif(node[:tag] == "p")
        puts("#{node[:text]} \n\n")
    elsif(node[:tag] == "h1")
        puts("***#{node[:text]}*** \n\n\n")
    elsif(node[:tag] == "div")
        node[:children].each {|child| render(child)}
    else
        return
    end
end

render(html)