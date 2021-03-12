require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @item = FactoryBot.build(:item) 
    @item.image = fixture_file_upload('app/assets/images/comment.png')
    @item.save

    @user = FactoryBot.create(:user) 

    @PurchaseAddress = FactoryBot.build(:PurchaseAddress, item_id: @item.id, user_id: @user.id)
  end

  describe '購入' do
    context '購入ができる時' do
      it '郵便番号、住所、電話番号、クレジットカード情報が入力されていれば購入できる' do
        expect(@PurchaseAddress).to be_valid
      end
    end

    context '購入できない時' do
      it '郵便番号が空では購入できない' do
        @PurchaseAddress.postal_code = ''
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがなければ購入できない' do
        @PurchaseAddress.postal_code = '0000000'
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角では購入できない' do
        @PurchaseAddress.postal_code = '０００-００００'
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)" )
      end

      it '都道府県名が選択されていないと購入できない' do
        @PurchaseAddress.first_address_id = 1
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("First address can't be blank")
      end
      it '市区町村が空では購入できない' do
        @PurchaseAddress.second_address = ''
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Second address can't be blank")
      end
      it '番地が空では購入できない' do
        @PurchaseAddress.third_address = ''
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Third address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @PurchaseAddress.telephone = ''
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号が全角では購入できない' do
        @PurchaseAddress.telephone = '０００００００００００'
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Telephone is invalid")

      end
      it '電話番号が11桁以内でないと購入できない' do
        @PurchaseAddress.telephone = '000000000000'
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Telephone is invalid")
      end
      it 'クレジットカード情報が空では購入できない' do
        @PurchaseAddress.token = ''
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザーが紐付いていなければ出品できない' do
        @PurchaseAddress.user_id = nil
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐付いていなければ出品できない' do
        @PurchaseAddress.item_id = nil
        @PurchaseAddress.valid?
        expect(@PurchaseAddress.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end