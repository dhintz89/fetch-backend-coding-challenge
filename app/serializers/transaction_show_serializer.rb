class TransactionShowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :payer_name, :points, :original_points, :created_at

  def points
    object.points.to_s + " points"
  end

  def original_points
    object.original_points.to_s + " points"
  end
end
