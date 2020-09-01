require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    query = DBConnection.execute2(<<-SQL).first
      select
        *
      from
        #{self.table_name}
    SQL
    query
    query.map!{ |tbl_str| tbl_str.to_sym }
    @columns = query
  end

  def self.finalize!
    self.columns.each do |col_name|
      define_method(col_name) do
        self.attributes[col_name]
      end

      define_method("#{col_name}=") do |value|
        self.attributes[col_name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |k,v|
      attr_name = k.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", v)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
