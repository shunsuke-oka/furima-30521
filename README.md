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
* has_many :buy_histories
* has_one :credit_card
* has_one :address

## items table

| Column         | Type        | Options            |
|----------------|-------------|--------------------|
| title          | string      | null: false        |
| text           | text        | null: false        |
| category_id    | integer     | null: false        |
| status_id      | integer     | null: false        |
| delivery_id    | integer     | null: false        |
| area_id        | integer     | null: false        |
| day_id         | integer     | null: false        |
| price          | integer     | null: false        |
| user           | references  | foreign_key: true  |

### Association

- belongs_to :user
- has_one :buy_history

## buy_histories table

| Column       | Type       | Options           |
|--------------|------------|-------------------|
| user         | references | foreign_key: true |
| item         | references | foreign_key: true |
| credit_card  | references | foreign_key: true |
| address      | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :credit_card
- belongs_to :address

## credit_cards table

| Column    | Type        | Options           |
|-----------|-------------|-------------------|
| card_num  | string      | null: false       |
| limit     | date        | null: false       |
| code      | string      | null: false       |
| user      | references  | foreign_key: true |
### Association

- has_one :buy_history
- belongs_to :user

## addresses table

| Column         | Type        | Options           |
|----------------|-------------|-------------------|
| post_num       | string      | null: false       |
| area_id        | integer     | null: false       |
| city_name      | string      | null: false       |
| city_num       | string      | null: false       |
| building_name  | string      | null: false       |
| phone_num      | string      | null: false       |
| user           | references  | foreign_key: true |

### Association

- has_one :buy_history
- belongs_to :user