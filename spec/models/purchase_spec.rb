require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user: @user, item: @item)
  end

  describe '商品購入' do
    context '商品が購入できる時' do
      it '必要な情報が存在すれば保存できる' do
        expect(@purchase).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'user_idが存在しなければ保存できない' do
        @purchase.user = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('User must exist')
      end

      it 'item_idが存在しなければ保存できない' do
        @purchase.item = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Item must exist')
      end
    end
  end
end
