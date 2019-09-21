class QuestionSerializer < ActiveModel::Serializer
  attributes :title, :mapping, :role

  def mapping
    object.mapping.title
  end

  def role
    object.role.name
  end
end