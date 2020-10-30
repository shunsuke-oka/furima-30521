require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("app/assets/images/item-sample.png")
  end

  describe 'itemの保存' do
    context "itemが保存できる場合" do
      it "imageとtitle,textとcategory_id、status_idとdelivery_id、area_idとday_id、priceがあればツイートは保存される" do
        expect(@item).to be_valid
      end
    end

    context "itemが保存できない場合" do
      it "titleが空では保存できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end   
      it "textが空では保存できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end    
      it "category_idが空では保存できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end    
      it "選択したcategory_idが1だった場合は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end    
      it "status_idが空では保存できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end    
      it "選択したstatus_idが1だった場合は保存できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end    
      it "delivery_idが空では保存できない" do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank", "Delivery is not a number")
      end    
      it "選択したdelivery_idが1だった場合は保存できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end   
      it "area_idが空では保存できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
      end
      it "選択したarea_idが1だった場合は保存できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end   
      it "day_idが空では保存できない" do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank", "Day is not a number")
      end    
      it "選択したday_idが1だった場合は保存できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end   
      it "priceが空では保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end    
      it "priceが¥300以上でないと保存できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end    
      it "priceが¥9,999,999以上でないと保存できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end    
      it "priceは半角数字のみ保存可能であること" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザーが紐付いていないとitemは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end