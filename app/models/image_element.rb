class ImageElement < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    url :string
    timestamps
  end

  has_one :page_element, :as => :insertable
  has_one :page, :through => :page_element

  class << self
    alias :orig_reverse_reflection :reverse_reflection

    def reverse_reflection(association)
      case association.to_sym
      when :page
        Page.reflections[:image_elements]
      else
        self.orig_reverse_reflection(association)
      end
    end
  end

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
