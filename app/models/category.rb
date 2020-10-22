class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },{ id: 2, name: 'レディース' },
   { id: 3, name: 'メンズ' },{ id: 4, name: 'ベビーキッズ' },
   { id: 5, name: 'インテリア・住まい・小物' },{ id: 6, name: '本・音楽・ゲーム' },
   { id: 7, name: 'おもちゃ・ホビー・グッズ' },{ id: 7, name: '家電・スマホ・カメラ' },
   { id: 7, name: 'スポーツ・レジャー' },{ id: 7, name: 'ハンドメイド' },
   { id: 7, name: 'その他' },
 ]
end
