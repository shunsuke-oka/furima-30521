 # DB 設計

## users table

| Column    | Type    | Options      |
|-----------|---------|--------------|
| nickname  | string  | null: false  |
| email     | string  | null: false  |
| password  | string  | null: false  |
| name      | string  | null: false  |
| birthday  | date    | null: false  |

### Association

* has_many :items
* has_many :buy_historys

## items table

| Column         | Type        | Options            |
|----------------|-------------|--------------------|
| title          | string      | null: false        |
| text           | text        | null: false        |
| category       | string      | null: false        |
| status         | string      | null: false        |
| delivery_price | integer     | null: false        |
| area           | string      | null: false        |
| day            | integer     | null: false        |
| price          | integer     | null: false        |
| user_id        | references  | foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy_history

## buy_historys table

| Column       | Type       | Options           |
|--------------|------------|-------------------|
| user_id      | references | foreign_key: true |
| item_id      | references | foreign_key: true |
| address      | text       | null: false       |
| credit_card  | string     | null: false       |

### Association

- belongs_to :user
- belongs_to :item