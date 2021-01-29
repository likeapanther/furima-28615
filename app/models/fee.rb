class Fee < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'なし' },
    { id: 3, name: '3%' },
    { id: 4, name: '5%' },
    { id: 5, name: '10%' }
  ]
end
