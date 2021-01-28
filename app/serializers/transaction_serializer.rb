class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :t_name, :description, :t_type, :t_amount, :account_id
end
