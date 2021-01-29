class Day < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '即発送可' },
    { id: 3, name: '2〜3日程度' },
    { id: 4, name: '1週間' },
    { id: 5, name: '未定' }
  ]
end
