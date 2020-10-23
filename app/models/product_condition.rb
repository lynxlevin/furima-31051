class ProductCondition < ActiveHash::Base
  self.data = [
    { id: 1, '---' },
    { id: 2, '新品、未使用' },
    { id: 3, '未使用に近い' },
    { id: 4, '目立った傷や汚れなし' },
    { id: 5, 'やや傷や汚れあり' },
    { id: 6, '傷や汚れあり' },
    { id: 7, '全体的に状態が悪い' }
  ]
end
