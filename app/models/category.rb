class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'キッズ・ベビー' },
    { id: 5, name: 'インテリア' },
    { id: 6, name: '本' },
    { id: 7, name: 'おもちゃ' },
    { id: 8, name: 'ハンドメイド' }
  ]
end
