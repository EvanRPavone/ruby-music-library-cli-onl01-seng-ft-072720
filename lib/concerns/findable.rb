module Concerns::Findable
  def find_by_name(label)
    all.find do |nm|
      nm.name == label
    end
  end
end
