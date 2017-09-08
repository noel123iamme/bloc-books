class Library
  @@libraries = [nil]

  attr_accessor :id, :title

  def initialize(title)
    @id = @@libraries.length
    @title = title
  end

  def self.all
    @@libraries
  end

  def self.destroy(id)
    @@libraries[id] = nil
  end

  def self.find(id)
    @@libraries[id]
  end

  def self.first
    @@libraries[1]
  end

  def self.last
    @@libraries.last
  end

  def save
    @@libraries[@id] = self
  end
end

Library.new("San Francisco Munical Library").save
Library.new("Library of Congress").save
Library.new("University of California Library").save
