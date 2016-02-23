# require "pp"
class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :attachments

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

  def images=(images)
    # raise images.pretty_inspect
    images.each do |image|
      attachments.create(image: image)
    end
  end

  def images
    attachments.map {|a| a.image}
  end
end
