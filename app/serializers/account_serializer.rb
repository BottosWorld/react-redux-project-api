class AccountSerializer < ActiveModel::Serializer
  attributes :id, :name, :balance, :acc_type
  has_many :transactions
end
