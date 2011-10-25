class TextElementsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  auto_actions_for :page, [ :index, :new, :create ]

  # this is necessary  the default code just calls 
  #   owner.text_elements.new
  #  which does not correctly set the page attribute of the text_element
  #  it seems like we might be able to get that to work with more AR annotations
  def new_for_page
    id = params["page_id"]
    owner = Page.find(id)
    new_text_element = owner.text_elements.new
    new_text_element.page = owner
    hobo_new_for :page, new_text_element
  end
  
  # this is necessary  the default code just calls 
  #   owner.text_elements.new(attributes_parameters)
  #  which like above does not correctly set the page attribute of the text_element
  #  if we can fix the issue above then this code would probably go way too
  def create_for_page
    id = params["page_id"]
    owner = Page.find(id)
    attributes = attribute_parameters
    attributes[:page] = owner
    hobo_create_for :page, :attributes => attributes
  end

end
