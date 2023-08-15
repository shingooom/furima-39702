require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
    @address = FactoryBot.build(:address, purchase: @purchase)
  end

  describe '住所情報の保存' do
    context '住所が保存できる時' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@address).to be_valid
      end
    end

    context '住所が保存できない時' do
      it 'purchaseが存在しなければ保存できない' do
        @address.purchase = nil
        @address.valid?
        expect(@address.errors.full_messages).to include('Purchase must exist')
      end

      it '正しくない郵便番号のフォーマットでは保存できない' do
        @address.postcode = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postcode must be in the format XXX-XXXX')
      end

      it 'region_idが0だと保存できない' do
        @address.region_id = 0
        @address.valid?
        expect(@address.errors.full_messages).to include('Region Select a region')
      end

      it '市区町村が入力されていなければ保存できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が入力されていなければ保存できない' do
        @address.street = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が10桁未満だと保存できない' do
        @address.phone = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone must be 10 or 11 digits long')
      end

      it '電話番号が11桁より多いと保存できない' do
        @address.phone = '123456789012'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone must be 10 or 11 digits long')
      end
    end
  end
end
