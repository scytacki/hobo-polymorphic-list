class Page < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end

  has_many :page_elements
  has_many :comments, :as => :commentable, :accessible => true
  
  has_many :text_elements, :through => :page_elements, :source => :insertable, :source_type => 'TextElement'
  
  children :page_elements

  class << self
    alias :orig_reverse_reflection :reverse_reflection
    
    def reverse_reflection(association)
      case association.to_sym
      when :text_elements
        PageElement.reflections[:page]
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
