class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      heredoc = <<-Magic_String
        def #{name}
          @#{name}
        end

        def #{name}=(new_value)
          @#{name} = new_value
        end
      Magic_String

      self.class_eval heredoc
    end
  end
end
