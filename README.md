# テーブル設計

## users テーブル
| Colummns | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_one  :profile
- has_many :items
- has_many :orders
- has_many :favorites
- has_many :comments

## profiles テーブル
| Colummns             | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| family_name_kanji    | string     | null: false                    |
| first_name_kanji     | string     | null: false                    |
| family_name_katakana | string     | null: false                    |
| first_name_katakana  | string     | null: false                    |
| birthday             | date       | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## items テーブル
| Colummns             | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| sold_out             | boolean    |                                |
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| category             | string     | null: false                    |
| product_condition    | string     | null: false                    |
| shipping_fee_bearer  | string     | null: false                    |
| ship_from_prefecture | string     | null: false                    |
| days_to_ship         | integer    | null: false                    |
| price                | integer    | null: false                    |
| commission           | integer    |                                |
| profit               | integer    |                                |
| user                 | references | null: false, foreign_key: true |

### Association
- belongs_to       :user
- has_one_attached :image
- has_one          :order
- has_many         :favorites
- has_many         :comments

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
| Colummns         | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zipcode          | string     | null: false                    |
| address1         | string     | null: false                    |
| address2         | string     | null: false                    |
| address3         | string     | null: false                    |
| address4         | string     | null: false                    |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
- belongs_to :order

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