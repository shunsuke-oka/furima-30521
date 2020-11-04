require 'rails_helper'

RSpec.describe BuyHistory, type: :model do
  before do
    @user_buy = FactoryBot.build(:user_buy)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@user_buy).to be_valid
  end
  it 'post_numが空だと保存できないこと' do
    @user_buy.post_num = nil
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include("Post num can't be blank")
  end
  it 'post_numが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @user_buy.post_num = '1234567'
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include("Post num is invalid. Include hyphen(-)")
  end
  it 'area_idが空だと保存できないこと' do
    @user_buy.area_id = nil
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include("Area id can't be blank")
  end
  it '選択したarea_idが1だった場合は保存できない' do
    @user_buy.area_id = 1
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include('Area must be other than 1')
  end
  it 'city_nameが空だと保存できないこと' do
    @user_buy.city_name = nil
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include("City name can't be blank")
  end
  it 'city_numが空だと保存できないこと' do
    @user_buy.city_num = nil
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include("City num can't be blank")
  end
  it 'building_nameが空だと保存できないこと' do
    @user_buy.building_name = nil
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include("Building name can't be blank")
  end
  it 'phone_numが空だと保存できないこと' do
    @user_buy.phone_num = nil
    @user_buy.valid?
    expect(@user_buy.errors.full_messages).to include("Phone num can't be blank")
  end
end