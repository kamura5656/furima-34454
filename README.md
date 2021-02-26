## usersテーブル 
| Culumn             | Type   | Options                   | 
| ------------------ | ------ | ------------------------- | 
| nickname           | string | null: false               | 
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

##Associstion
- has_many :items
- has_many :purchases

## itemsテーブル
| Culumn           | Type          | Options                        | 
| ---------------- | ------------- | ------------------------------ | 
| items_name       | string        | null: false                    | 
| contents         | text          | null: false                    |
| category_id      | integer       | null: false                    |
| status_id        | integer       | null: false                    |
| delivery_fee_id  | integer       | null: false                    |
| first_address_id | integer       | null: false                    |
| delivery_days_id | integer       | null: false                    |
| price            | integer       | null: false                    |
| user             | references    | null: false, foreign_key: true |

##Associstion
- has_one :purchase
- belongs_to :user

## purchasesテーブル
| Culumn    | Type       | Options                        | 
| --------- | ---------- | -------------------------------| 
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

##Associstion
- belongs_to :item
- belongs_to :user
- has_one :address

## addresssテーブル
| Culumn            | Type       | Options     | 
| ----------------- | ---------- | ----------- | 
| purchase_id       | integer    | null: false | 
| postal_code       | string     | null: false | 
| first_address_id  | integer    | null: false | 
| second_address    | string     | null: false | 
| third_address     | string     | null: false | 
| fourth_address    | string     |             | 
| telephone         | string     | null: false | 

##Associstion
- belongs_to :purchase

