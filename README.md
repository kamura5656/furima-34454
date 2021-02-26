## usersテーブル 
| Culumn        | Type   | Options  | 
| ----------    | ------ | -------- | 
| nickname      | string | NOT NULL | 
| mail_address  | string | NOT NULL | 
| password      | string | NOT NULL | 
| my_name       | string | NOT NULL | 
| furigana      | string | NOT NULL | 
| birthday      | date   | NOT NULL | 

##Associstion
- has_many :items
- has_many :purchases

## itemsテーブル
| Culumn        | Type          | Options  | 
| ----------    | ------------- | -------- | 
| photo         | ActiveStorage |          | 
| items_name    | string        | NOT NULL | 
| contents      | text          | NOT NULL | 
| category      | ActiveStorage | NOT NULL | 
| status        | integer       | NOT NULL | 
| delivery_fee  | integer       | NOT NULL | 
| from          | integer       | NOT NULL | 
| delivery_days | integer       | NOT NULL | 
| price         | integer       | NOT NULL | 
| user_id       | references    | NOT NULL |

##Associstion
- has_one :purchases
- belongs_to :users

## purchasesテーブル
| Culumn    | Type       | Options  | 
| --------- | ---------- | -------- | 
| card      | integer    | NOT NULL | 
| address   | text       | NOT NULL | 
| item_id   | references | NOT NULL | 
| user_id   | references | NOT NULL | 

##Associstion
- be_longs :items
- be_longs :users

