class DaysToShip < ActiveHash::Base
  self.data = [
    { id:1, '---' },
    { id:2, '1~2日で発送' },
    { id:3, '2~3日で発送' },
    { id:4, '4~7日で発送' }
  ]
end
