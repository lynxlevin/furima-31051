# テーブル設計

## users テーブル
| Colummns             | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| nickname             | string     | null: false, uniqueness: true |
| email                | string     | null: false                   |
| password             | string     | null: false                   |
| family_name_kanji    | string     | null: false                   |
| first_name_kanji     | string     | null: false                   |
| family_name_katakana | string     | null: false                   |
| first_name_katakana  | string     | null: false                   |
| birthday             | date       | null: false                   |

### Association
- has_many :items
- has_many :orders
- has_many :favorites
- has_many :comments

## items テーブル
| Colummns                | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| description             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| product_condition_id    | integer    | null: false                    |
| shipping_fee_bearer_id  | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| days_to_ship_id         | integer    | null: false                    |
| price                   | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association
- belongs_to       :user
- has_one_attached :image
- has_one          :order
- has_many         :favorites
- has_many         :comments
- belongs_to_active_hash :category
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :shipping_fee_bearer
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :days_to_ship

## orders テーブル
| Colummns     | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to    :user
- belongs_to    :item
- has_one       :delivery_address
- attr_accessor :token <!-- Pay.jpのトークン -->

## delivery_addresses テーブル
| Colummns          | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| zipcode           | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| block             | string     | null: false                    |
| building_and_room | string     |                                |
| telephone_number  | string     | null: false                    |
| order             | references | null: false, foreign_key: true |

### Association
- belongs_to :order
- belongs_to_active_hash :prefecture

## favorites テーブル
| Colummns     | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## comments テーブル
| Colummns     | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
| text         | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :item