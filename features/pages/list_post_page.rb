require 'page-object'

class HomePage
  include PageObject

  page_url 'www.csciblog.com'
  
  divs(:post_list, id: 'post')
  divs(:post_title_list, id: 'title')
  divs(:post_author_list, id: 'author')
  divs(:post_date_list, id: 'date')
  
  button(:new_post_button, id: 'creatnewpost')
  links(:post_link, id: 'postlink')

  def find_test_post
      test_found = false
      for i in 0..(self.post_list_elements.length - 1)
        if (self.post_list_elements[i].div.text == "test")
          test_found = true
        end
      end
    return test_found
  end

  def date_order_test       # Date Format = MM/DD/YY  --> array indices([] = /) --> 01[2]34[5]67
    is_ordered = false
    for i in (1..(self.post_date_list_elements.length - 1))
      if (self.post_date_list_elements[i].text[0,1] > 
        self.post_date_list_elements[i-1].text[0,1])
        is_ordered = true
      elsif (self.post_date_list_elements[i].text[3,4] >
        self.post_date_list_elements[i-1].text[3,4])
        is_ordered = true
      else (self.post_date_list_elements[i].text[6,7] >
        self.post_date_list_elements[i-1].text[6,7])
        is_ordered = true
      end
    end
    return is_ordered
  end
  
end