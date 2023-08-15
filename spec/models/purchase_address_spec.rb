RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入と住所情報の保存' do
    context '保存できる場合' do
      it '全ての項目が正しく入力されていれば保存できる' do
        expect(@purchase_address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '保存できない場合' do
      it 'userが紐付いていなければ購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が空では購入できない' do
        @purchase_address.postcode = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @purchase_address.postcode = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postcode must be in the format XXX-XXXX')
      end

      it '都道府県に「---」が選択されている場合は購入できない' do
        @purchase_address.region_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Region Select a region')
      end

      it '市区町村が空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @purchase_address.street = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が空では購入できない' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_address.phone = '1234567a890'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone must be 10 or 11 digits long')
      end

      it '電話番号が9桁以下では購入できない' do
        @purchase_address.phone = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone must be 10 or 11 digits long')
      end

      it '電話番号が12桁以上では購入できない' do
        @purchase_address.phone = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone must be 10 or 11 digits long')
      end

      # トークンのテストも追加します。
      it 'tokenが空だと保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
