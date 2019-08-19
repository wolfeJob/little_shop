class Review <ApplicationRecord
  belongs_to :items

  valiates_presence_of :title,
                       :content,
                       :rating
end
