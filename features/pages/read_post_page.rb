require 'page-object'

class ReadPost
  include PageObject
  
  div(:post_title, id: 'title')
  div(:post_author, id: 'author')
  div(:post_body, id: 'body')
  divs(:comment, id: 'comment')
  divs(:comment_date_list, id: 'commentdate')
  divs(:comment_author_list, id: 'commentauthor')
  divs(:comment_body_list, id: 'commentbody')
  
  text_field(:new_comment, id: 'newcomment')

  button(:create_comment, id: 'createcomment')
  link(:home_link, id: 'home')
  
  def title_author_test
    test_passed = false
    if (self.post_title.text != "" &&
      self.post_author != "")
      test_passed = true
    end
    return test_passed
  end
  
  def date_order_test       # Date Format = MM/DD/YY  --array indices([] = /)--> 01[2]34[5]67
    is_ordered = false
    for i in (1..(self.comment_date_list_elements.length - 1))
      if (self.comment_date_list_elements[i].text[0,1] > 
        self.comment_date_list_elements[i-1].text[0,1])
        is_ordered = true
      elsif (self.comment_date_list_elements[i].text[3,4] >
        self.comment_date_list_elements[i-1].text[3,4])
        is_ordered = true
      else (self.comment_date_list_elements[i].text[6,7] >
        self.comment_date_list_elements[i-1].text[6,7])
        is_ordered = true
      end
    end
    return is_ordered
  end

  def write_comment
    made_comment = false
    self.new_comment = "test comment"
    self.create_comment
    if (self.new_comment == "")
      made_comment = true
    end
  end
  
end