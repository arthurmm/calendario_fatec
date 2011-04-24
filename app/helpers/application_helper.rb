module ApplicationHelper
  def edit_link(*args)
      link_to(image_tag('edit.jpg', {:class=>"link_button" }), *args)
  end

  def select_link(*args)
    link_to(image_tag('select.png', {:class=>"link_button" }), *args)
  end

  def delete_link(*args)
    link_to(image_tag('delete.gif', {:class=>"link_button" }), *args)
  end
end

