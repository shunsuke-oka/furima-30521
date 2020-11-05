class UserBuy
  include ActiveModel::Model
  attr_accessor :token, :post_num, :area_id, :city_name, :city_num, :building_name, :phone_num, :buy_history_id, :item_id, :user_id

  with_options presence: true do
    validates :token

    validates :post_num, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 }
    validates :city_name
    validates :city_num
    validates :phone_num, format: {with: /\A\d{10,11}\z/, message: "is invalid. Input half-width characters."}
  end

  def save
    buy_history = BuyHistory.create!(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create!(post_num: post_num, area_id: area_id, city_name: city_name, city_num: city_num, building_name: building_name, phone_num: phone_num, buy_history_id: buy_history.id)
  end
end